@tool
extends EditorPlugin


func _define_project_setting(
		p_name : String,
		p_type : int,
		p_hint : int = PROPERTY_HINT_NONE,
		p_hint_string : String = "",
		p_default_val = "") -> void:
	# p_default_val can be any type!!

	if !ProjectSettings.has_setting(p_name):
		ProjectSettings.set_setting(p_name, p_default_val)

	var property_info : Dictionary = {
		"name" : p_name,
		"type" : p_type,
		"hint" : p_hint,
		"hint_string" : p_hint_string
	}

	ProjectSettings.add_property_info(property_info)
	if ProjectSettings.has_method("set_as_basic"):
		ProjectSettings.call("set_as_basic", p_name, true)
	ProjectSettings.set_initial_value(p_name, p_default_val)



func _enter_tree():
	# Add body tracker name
	_define_project_setting(
			"axis_studio_tracker/tracking/body_tracker_name",
			TYPE_STRING,
			PROPERTY_HINT_NONE,
			"",
			"/axis_studio/body")

	# Add position mode
	_define_project_setting(
			"axis_studio_tracker/tracking/position_mode",
			TYPE_INT,
			PROPERTY_HINT_ENUM,
			"Free,Calibrate,Locked",
			0)

	# Add network port
	_define_project_setting(
			"axis_studio_tracker/network/udp_listener_port",
			TYPE_INT,
			PROPERTY_HINT_NONE,
			"",
			7004)

	# Register our autoload user settings object
	add_autoload_singleton(
			"AxisStudioTracker",
			"res://addons/godot_axis_studio_tracker/axis_studio_tracker.gd")


func _exit_tree():
	# our plugin is turned off
	pass
