extends Node


## Axis Studio Tracker Script
##
## This script processes Axis Studio packets into XRBodyTracker data for
## driving avatars.


## Enumeration of position modes
enum PositionMode {
	FREE,			## Free movement
	CALIBRATE,		## Calibrate horizontal position on the first frame
	LOCKED			## Lock horizontal position
}


## Body tracking flags
const BODY_TRACKING := \
	XRBodyTracker.BODY_FLAG_UPPER_BODY_SUPPORTED | \
	XRBodyTracker.BODY_FLAG_LOWER_BODY_SUPPORTED | \
	XRBodyTracker.BODY_FLAG_HANDS_SUPPORTED

## Joint tracking flags
const JOINT_TRACKING := \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_VALID | \
	XRBodyTracker.JOINT_FLAG_POSITION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_POSITION_VALID


# Axis Studio reader instance
var _axis_studio_reader : AxisStudioReader = AxisStudioReader.new()

# Body tracker instance to publish tracking data
var _body_tracker : XRBodyTracker = XRBodyTracker.new()

# Position mode
var _position_mode : PositionMode = PositionMode.FREE

# Array of joint absolute positions
var _abs_positions : Array[Vector3] = []

# Array of joint absolute rotations
var _abs_rotations : Array[Quaternion] = []

# Position calibration
var _position_calibration : Vector3 = Vector3.ZERO

# Calibrated flag
var _position_calibrated : bool = false


func _enter_tree() -> void:
	# Fill the position and rotation arrays
	_abs_positions.resize(AxisStudioBody.Joint.COUNT)
	_abs_rotations.resize(AxisStudioBody.Joint.COUNT)
	_abs_positions.fill(Vector3.ZERO)
	_abs_rotations.fill(Quaternion.IDENTITY)

	# Get the body tracker name
	var body_tracker_name : String = ProjectSettings.get_setting(
		"axis_studio_tracker/tracking/body_tracker_name",
		"/axis_studio/body")

	# Register the body tracker
	XRServer.add_body_tracker(body_tracker_name, _body_tracker)

	# Get the position mode
	_position_mode = ProjectSettings.get_setting(
		"axis_studio_tracker/tracking/position_mode",
		0)

	# Get the Axis Studio port number
	var udp_listener_port : int = ProjectSettings.get_setting(
		"axis_studio_tracker/network/udp_listener_port",
		7004)

	# Start listening for VMC packets
	_axis_studio_reader.on_axis_studio_packet.connect(_on_axis_studio_packet)
	_axis_studio_reader.listen(udp_listener_port)


func _process(_delta : float) -> void:
	# Poll for incoming packets
	_axis_studio_reader.poll()


# Handle received Axis Studio packet data
func _on_axis_studio_packet(data : AxisStudioBody.JointData) -> void:
	# Flatten the joint tree to absolute positions
	for joint in AxisStudioBody.Joint.COUNT:
		# Get the relative position data and parent
		var parent_joint := AxisStudioBody.JOINT_PARENT[joint]
		var pos := data.positions[joint]
		var rot := data.rotations[joint]

		# If hips then consider position calibration
		if joint == AxisStudioBody.Joint.HIPS:
			match _position_mode:
				PositionMode.CALIBRATE:
					# Calibrate on first position
					if not _position_calibrated:
						_position_calibrated = true
						_position_calibration = pos.slide(Vector3.UP)

					# Apply calibration
					pos -= _position_calibration

				PositionMode.LOCKED:
					# Project position to vertical axis
					pos = pos.project(Vector3.UP)

		# If child-joint then convert relative to absolute
		if parent_joint >= 0:
			var parent_pos := _abs_positions[parent_joint]
			var parent_rot := _abs_rotations[parent_joint]
			pos = parent_pos + parent_rot * pos
			rot = parent_rot * rot

		# Save absolute position
		_abs_positions[joint] = pos
		_abs_rotations[joint] = rot

	# Apply to the XRBodyTracker
	for joint in AxisStudioBody.JOINT_MAPPING:
		var body : XRBodyTracker.Joint = joint["body"]
		var native : AxisStudioBody.Joint = joint["native"]
		var roll : Quaternion = joint["roll"]

		# Set the joint transform
		_body_tracker.set_joint_transform(
			body,
			Transform3D(
				Basis(_abs_rotations[native] * roll),
				_abs_positions[native]))

		# Set the joint flags
		_body_tracker.set_joint_flags(body, JOINT_TRACKING)

	# Calculate and set the root joint under the hips
	var root := _body_tracker.get_joint_transform(XRBodyTracker.JOINT_HIPS)
	root.basis = Basis.IDENTITY
	root.origin = root.origin.slide(Vector3.UP)
	_body_tracker.set_joint_transform(XRBodyTracker.JOINT_ROOT, root)
	_body_tracker.set_joint_flags(XRBodyTracker.JOINT_ROOT, JOINT_TRACKING)

	# Indicate we are tracking the body
	_body_tracker.body_flags = BODY_TRACKING
	_body_tracker.has_tracking_data = true
