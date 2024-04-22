extends Node


## Axis Studio Plugin Node
##
## This node provides an Axis Studio tracker as a plugin autoload singleton.


# Tracker source
var _source : AxisStudioSource


# On entering the scene-tree, construct the tracker source and start listening
# for incoming packets.
func _enter_tree() -> void:
	# Get the body tracker name
	var body_tracker_name : String = ProjectSettings.get_setting(
		"axis_studio_tracker/tracking/body_tracker_name",
		"/axis_studio/body_tracker")

	# Get the position mode
	var position_mode = ProjectSettings.get_setting(
		"axis_studio_tracker/tracking/position_mode",
		0)

	# Get the MVN port number
	var udp_listener_port : int = ProjectSettings.get_setting(
		"axis_studio_tracker/network/udp_listener_port",
		7004)

	_source = AxisStudioSource.new(body_tracker_name, position_mode, udp_listener_port)


# On frame processing, poll the tracker source for updates.
func _process(_delta: float) -> void:
	_source.poll()
