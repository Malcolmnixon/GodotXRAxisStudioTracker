class_name AxisStudioReader
extends Object


## Axis Studio Reader Script
##
## This script implements an Axis Studio reader. The listen method is used to
## start the UDP server. The poll method should be called to poll for
## incoming packets. Packets are decoded and dispatched through the
## on_axis_studio_packet signal.


## Axis Studio packed received signal
signal on_axis_studio_packet(data : AxisStudioBody.JointData)


# UDP Server
var _server : UDPServer = UDPServer.new()

# Current connection
var _connection : PacketPeerUDP

# Joint data
var _data := AxisStudioBody.JointData.new()


## Stop listening
func stop() -> void:
	_server.stop()
	_connection = null


## Start listening
func listen(p_port : int = 7004) -> void:
	stop()
	_server.listen(p_port)


## Poll for incoming packets
func poll() -> void:
	# Poll the server
	_server.poll()

	# Switch to any new connection
	if _server.is_connection_available():
		_connection = _server.take_connection()

	# Skip if no connection
	if not _connection:
		return

	# Loop processing the incoming packets
	while _connection.get_available_packet_count() > 0:
		_read_axis_studio_packet(_connection.get_packet())


# Read an Axis Studio packet
func _read_axis_studio_packet(packet : PackedByteArray) -> void:
	# The BVH header consists of a 64-byte header with:
	# - [ 0 ..  1] = Header Token "FF DD"
	# - [ 2 ..  5] = Version "01 00 01 01" = 1.1.0.1
	# - [ 6 ..  7] = Data Count "62-01" = 354 floats
	# - [ 8      ] = Displacement "01"
	# - [ 9      ] = Reference "00"
	# - [10 .. 13] = Avatar Index "00-00-00-00" = 0
	# - [14 .. 45] = Avatar Name "chr00"
	# - [46 .. 49] = Frame Index "74-00-00-00" = frame 116
	# - [50 .. 53] = Reserved
	# - [54 .. 57] = Reserved
	# - [58 .. 61] = Reserved
	# - [62 .. 63] = Footer Token "FF EE"
	# Following the header is an array of "Data Count" 32-bit floats.

	# Skip runt packets
	if packet.size() < 64:
		return

	# Skip if the header is invalid
	if packet.decode_u16(0) != 0xDDFF:
		return

	# Skip if the footer is invalid
	if packet.decode_u16(62) != 0xEEFF:
		return

	# Get the count of joints
	var joint_count := packet.decode_u16(6) / 6
	if joint_count != AxisStudioBody.Joint.COUNT:
		return

	# Decode the data values
	var values := packet.slice(64, 64 + AxisStudioBody.Joint.COUNT * 6 * 4).to_float32_array()

	# Process the joint data
	for joint in AxisStudioBody.Joint.COUNT:
		var base := joint * 6

		# Save the position
		_data.positions[joint] = Vector3(
			values[base] * 0.01,
			values[base + 1] * 0.01,
			values[base + 2] * 0.01)

		# Decode the euler rotation
		var euler := Vector3(
			deg_to_rad(values[base + 4]),
			deg_to_rad(values[base + 3]),
			deg_to_rad(values[base + 5]))

		# Save the rotation
		_data.rotations[joint] = Quaternion.from_euler(euler)

	# Report the updated data
	on_axis_studio_packet.emit(_data)
