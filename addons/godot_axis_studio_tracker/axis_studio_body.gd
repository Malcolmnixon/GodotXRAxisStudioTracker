class_name AxisStudioBody


## Constants for Axis Studio Body
##
## This script contains the definitions required to interpret the Axis Studio
## body and translate it to XRBodyTracker format.


## Enumeration of Axis Studio joints
enum Joint {
	HIPS = 0,
	RIGHT_UP_LEG = 1,
	RIGHT_LEG = 2,
	RIGHT_FOOT = 3,
	LEFT_UP_LEG = 4,
	LEFT_LEG = 5,
	LEFT_FOOT = 6,
	SPINE = 7,
	SPINE_1 = 8,
	SPINE_2 = 9,
	SPINE_3 = 10,
	NECK = 11,
	HEAD = 12,
	RIGHT_SHOULDER = 13,
	RIGHT_ARM = 14,
	RIGHT_FORE_ARM = 15,
	RIGHT_HAND = 16,
	RIGHT_HAND_THUMB_1 = 17,
	RIGHT_HAND_THUMB_2 = 18,
	RIGHT_HAND_THUMB_3 = 19,
	RIGHT_IN_HAND_INDEX = 20,
	RIGHT_HAND_INDEX_1 = 21,
	RIGHT_HAND_INDEX_2 = 22,
	RIGHT_HAND_INDEX_3 = 23,
	RIGHT_IN_HAND_MIDDLE = 24,
	RIGHT_HAND_MIDDLE_1 = 25,
	RIGHT_HAND_MIDDLE_2 = 26,
	RIGHT_HAND_MIDDLE_3 = 27,
	RIGHT_IN_HAND_RING = 28,
	RIGHT_HAND_RING_1 = 29,
	RIGHT_HAND_RING_2 = 30,
	RIGHT_HAND_RING_3 = 31,
	RIGHT_IN_HAND_PINKY = 32,
	RIGHT_HAND_PINKY_1 = 33,
	RIGHT_HAND_PINKY_2 = 34,
	RIGHT_HAND_PINKY_3 = 35,
	LEFT_SHOULDER = 36,
	LEFT_ARM = 37,
	LEFT_FORE_ARM = 38,
	LEFT_HAND = 39,
	LEFT_HAND_THUMB_1 = 40,
	LEFT_HAND_THUMB_2 = 41,
	LEFT_HAND_THUMB_3 = 42,
	LEFT_IN_HAND_INDEX = 43,
	LEFT_HAND_INDEX_1 = 44,
	LEFT_HAND_INDEX_2 = 45,
	LEFT_HAND_INDEX_3 = 46,
	LEFT_IN_HAND_MIDDLE = 47,
	LEFT_HAND_MIDDLE_1 = 48,
	LEFT_HAND_MIDDLE_2 = 49,
	LEFT_HAND_MIDDLE_3 = 50,
	LEFT_IN_HAND_RING = 51,
	LEFT_HAND_RING_1 = 52,
	LEFT_HAND_RING_2 = 53,
	LEFT_HAND_RING_3 = 54,
	LEFT_IN_HAND_PINKY = 55,
	LEFT_HAND_PINKY_1 = 56,
	LEFT_HAND_PINKY_2 = 57,
	LEFT_HAND_PINKY_3 = 58,
	COUNT = 59
}

## Axis Studio Joint Parent relationship
const JOINT_PARENT : Array[Joint] = [
	-1,								# 0: Joint.HIPS
	Joint.HIPS,						# 1: Joint.RIGHT_UP_LEG
	Joint.RIGHT_UP_LEG,				# 2: Joint.RIGHT_LEG
	Joint.RIGHT_LEG,				# 3: Joint.RIGHT_FOOT
	Joint.HIPS,						# 4: Joint.LEFT_UP_LEG
	Joint.LEFT_UP_LEG,				# 5: Joint.LEFT_LEG
	Joint.LEFT_LEG,					# 6: Joint.LEFT_FOOT
	Joint.HIPS,						# 7: Joint.SPINE
	Joint.SPINE,					# 8: Joint.SPINE_1
	Joint.SPINE_1,					# 9: Joint.SPINE_2
	Joint.SPINE_2,					# 10: Joint.SPINE_3
	Joint.SPINE_3,					# 11: Joint.NECK
	Joint.NECK,						# 12: Joint.HEAD
	Joint.SPINE_2,					# 13: Joint.RIGHT_SHOULDER
	Joint.RIGHT_SHOULDER,			# 14: Joint.RIGHT_ARM
	Joint.RIGHT_ARM,				# 15: Joint.RIGHT_FORE_ARM
	Joint.RIGHT_FORE_ARM,			# 16: Joint.RIGHT_HAND
	Joint.RIGHT_HAND,				# 17: Joint.RIGHT_HAND_THUMB_1
	Joint.RIGHT_HAND_THUMB_1,		# 18: Joint.RIGHT_HAND_THUMB_2
	Joint.RIGHT_HAND_THUMB_2,		# 19: Joint.RIGHT_HAND_THUMB_3
	Joint.RIGHT_HAND,				# 20: Joint.RIGHT_IN_HAND_INDEX
	Joint.RIGHT_IN_HAND_INDEX,		# 21: Joint.RIGHT_HAND_INDEX_1
	Joint.RIGHT_HAND_INDEX_1,		# 22: Joint.RIGHT_HAND_INDEX_2
	Joint.RIGHT_HAND_INDEX_2,		# 23: Joint.RIGHT_HAND_INDEX_3
	Joint.RIGHT_HAND,				# 24: Joint.RIGHT_IN_HAND_MIDDLE
	Joint.RIGHT_IN_HAND_MIDDLE,		# 25: Joint.RIGHT_HAND_MIDDLE_1
	Joint.RIGHT_HAND_MIDDLE_1,		# 26: Joint.RIGHT_HAND_MIDDLE_2
	Joint.RIGHT_HAND_MIDDLE_2,		# 27: Joint.RIGHT_HAND_MIDDLE_3
	Joint.RIGHT_HAND,				# 28: Joint.RIGHT_IN_HAND_RING
	Joint.RIGHT_IN_HAND_RING,		# 29: Joint.RIGHT_HAND_RING_1
	Joint.RIGHT_HAND_RING_1,		# 30: Joint.RIGHT_HAND_RING_2
	Joint.RIGHT_HAND_RING_2,		# 31: Joint.RIGHT_HAND_RING_3
	Joint.RIGHT_HAND,				# 32: Joint.RIGHT_IN_HAND_PINKY
	Joint.RIGHT_IN_HAND_PINKY,		# 33: Joint.RIGHT_HAND_PINKY_1
	Joint.RIGHT_HAND_PINKY_1,		# 34: Joint.RIGHT_HAND_PINKY_2
	Joint.RIGHT_HAND_PINKY_2,		# 35: Joint.RIGHT_HAND_PINKY_3
	Joint.SPINE_2,					# 36: Joint.LEFT_SHOULDER
	Joint.LEFT_SHOULDER,			# 37: Joint.LEFT_ARM
	Joint.LEFT_ARM,					# 38: Joint.LEFT_FORE_ARM
	Joint.LEFT_FORE_ARM,			# 39: Joint.LEFT_HAND
	Joint.LEFT_HAND,				# 40: Joint.LEFT_HAND_THUMB_1
	Joint.LEFT_HAND_THUMB_1,		# 41: Joint.LEFT_HAND_THUMB_2
	Joint.LEFT_HAND_THUMB_2,		# 42: Joint.LEFT_HAND_THUMB_3
	Joint.LEFT_HAND,				# 43: Joint.LEFT_IN_HAND_INDEX
	Joint.LEFT_IN_HAND_INDEX,		# 44: Joint.LEFT_HAND_INDEX_1
	Joint.LEFT_HAND_INDEX_1,		# 45: Joint.LEFT_HAND_INDEX_2
	Joint.LEFT_HAND_INDEX_2,		# 46: Joint.LEFT_HAND_INDEX_3
	Joint.LEFT_HAND,				# 47: Joint.LEFT_IN_HAND_MIDDLE
	Joint.LEFT_IN_HAND_MIDDLE,		# 48: Joint.LEFT_HAND_MIDDLE_1
	Joint.LEFT_HAND_MIDDLE_1,		# 49: Joint.LEFT_HAND_MIDDLE_2
	Joint.LEFT_HAND_MIDDLE_2,		# 50: Joint.LEFT_HAND_MIDDLE_3
	Joint.LEFT_HAND,				# 51: Joint.LEFT_IN_HAND_RING
	Joint.LEFT_IN_HAND_RING,		# 52: Joint.LEFT_HAND_RING_1
	Joint.LEFT_HAND_RING_1,			# 53: Joint.LEFT_HAND_RING_2
	Joint.LEFT_HAND_RING_2,			# 54: Joint.LEFT_HAND_RING_3
	Joint.LEFT_HAND,				# 55: Joint.LEFT_IN_HAND_PINKY
	Joint.LEFT_IN_HAND_PINKY,		# 56: Joint.LEFT_HAND_PINKY_1
	Joint.LEFT_HAND_PINKY_1,		# 57: Joint.LEFT_HAND_PINKY_2
	Joint.LEFT_HAND_PINKY_2,		# 58: Joint.LEFT_HAND_PINKY_3
]

## Mapping of XRBodyTracker joints to Axis Studio joints
const JOINT_MAPPING : Array[Dictionary] = [
	# Upper Body Joints
	{
		body = XRBodyTracker.JOINT_HIPS,
		native = Joint.HIPS,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_SPINE,
		native = Joint.SPINE,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_CHEST,
		native = Joint.SPINE_1,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_UPPER_CHEST,
		native = Joint.SPINE_3,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_NECK,
		native = Joint.NECK,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_HEAD,
		native = Joint.HEAD,
		roll = Quaternion.IDENTITY
	},
	{
		body = XRBodyTracker.JOINT_LEFT_SHOULDER,
		native = Joint.LEFT_SHOULDER,
		roll = Quaternion(0.5, 0.5, 0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_ARM,
		native = Joint.LEFT_ARM,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_ARM,
		native = Joint.LEFT_FORE_ARM,
		roll = Quaternion(0.0, 0.0, -0.7071068, 0.7071068)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_SHOULDER,
		native = Joint.RIGHT_SHOULDER,
		roll = Quaternion(-0.5, 0.5, 0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_ARM,
		native = Joint.RIGHT_ARM,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_ARM,
		native = Joint.RIGHT_FORE_ARM,
		roll = Quaternion(0.0, 0.0, 0.7071068, 0.7071068)
	},

	# Lower Body Joints
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_LEG,
		native = Joint.LEFT_UP_LEG,
		roll = Quaternion(0.0, 0.0, 1.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_LEG,
		native = Joint.LEFT_LEG,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_FOOT,
		native = Joint.LEFT_FOOT,
		roll = Quaternion(0.0, 0.7071068, 0.7071068, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_LEG,
		native = Joint.RIGHT_UP_LEG,
		roll = Quaternion(0.0, 0.0, 1.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_LEG,
		native = Joint.RIGHT_LEG,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_FOOT,
		native = Joint.RIGHT_FOOT,
		roll = Quaternion(0.0, 0.7071068, 0.7071068, 0.0)
	},

	# Left Hand Joints
	{
		body = XRBodyTracker.JOINT_LEFT_HAND,
		native = Joint.LEFT_HAND,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_WRIST,
		native = Joint.LEFT_HAND,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_METACARPAL,
		native = Joint.LEFT_HAND_THUMB_1,
		roll = Quaternion(0.7071068, 0.7071068, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_PROXIMAL,
		native = Joint.LEFT_HAND_THUMB_2,
		roll = Quaternion(0.7071068, 0.7071068, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_DISTAL,
		native = Joint.LEFT_HAND_THUMB_3,
		roll = Quaternion(0.7071068, 0.7071068, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_METACARPAL,
		native = Joint.LEFT_IN_HAND_INDEX,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_HAND_INDEX_1,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_HAND_INDEX_2,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_HAND_INDEX_3,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_METACARPAL,
		native = Joint.LEFT_IN_HAND_MIDDLE,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_HAND_MIDDLE_1,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_HAND_MIDDLE_2,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_HAND_MIDDLE_3,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_METACARPAL,
		native = Joint.LEFT_IN_HAND_RING,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_HAND_RING_1,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_HAND_RING_2,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_HAND_RING_3,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_METACARPAL,
		native = Joint.LEFT_IN_HAND_PINKY,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_HAND_PINKY_1,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_HAND_PINKY_2,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_HAND_PINKY_3,
		roll = Quaternion(0.5, 0.5, -0.5, 0.5)
	},

	# Right Hand Joints
	{
		body = XRBodyTracker.JOINT_RIGHT_HAND,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_WRIST,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_METACARPAL,
		native = Joint.RIGHT_HAND_THUMB_1,
		roll = Quaternion(-0.7071068, 0.7071068, 0, 0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_PROXIMAL,
		native = Joint.RIGHT_HAND_THUMB_2,
		roll = Quaternion(-0.7071068, 0.7071068, 0, 0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_DISTAL,
		native = Joint.RIGHT_HAND_THUMB_3,
		roll = Quaternion(-0.7071068, 0.7071068, 0, 0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_METACARPAL,
		native = Joint.RIGHT_IN_HAND_INDEX,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_HAND_INDEX_1,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_HAND_INDEX_2,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_HAND_INDEX_3,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_METACARPAL,
		native = Joint.RIGHT_IN_HAND_MIDDLE,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_HAND_MIDDLE_1,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_HAND_MIDDLE_2,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_HAND_MIDDLE_3,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_METACARPAL,
		native = Joint.RIGHT_IN_HAND_RING,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_HAND_RING_1,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_HAND_RING_2,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_HAND_RING_3,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_METACARPAL,
		native = Joint.RIGHT_IN_HAND_PINKY,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_HAND_PINKY_1,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_HAND_PINKY_2,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_HAND_PINKY_3,
		roll = Quaternion(-0.5, 0.5, -0.5, -0.5)
	},
]


## Joint Data class
class JointData:
	## Joint positions
	var positions : Array[Vector3]

	## Joint rotations
	var rotations : Array[Quaternion]

	# Initialize the Joint Data class
	func _init():
		# Initialize the positions array
		positions = []
		positions.resize(Joint.COUNT)
		positions.fill(Vector3.ZERO)

		# Initialize the rotations array
		rotations = []
		rotations.resize(Joint.COUNT)
		rotations.fill(Quaternion.IDENTITY)
