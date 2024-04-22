class_name AxisStudioTracker
extends Node


## Axis Studio Tracker Node
##
## This node provides an Axis Studio tracker as a scene-tree node. It may also
## be instantiated as an autoload to provide for multiple trackers on different
## ports.


## Body tracker name
@export var body_tracker_name : String = "/axis_studio/body_tracker"

## Position mode
@export_enum("Free", "Calibrate", "Locked") var position_mode : int = 0

## UDP listener port
@export var udp_listener_port : int = 7004


# Tracker source
var _source : AxisStudioSource


# On entering the scene-tree, construct the tracker source and start listening
# for incoming packets.
func _enter_tree() -> void:
	_source = AxisStudioSource.new(body_tracker_name, position_mode, udp_listener_port)


# On frame processing, poll the tracker source for updates.
func _process(_delta: float) -> void:
	_source.poll()
