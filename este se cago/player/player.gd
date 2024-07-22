extends Node
#
#@onready var head_rotation: Marker3D = $player2/player/Skeleton3D/Head_rotation
#@onready var skeleton_ik_3d: SkeletonIK3D = $player2/player/Skeleton3D/SkeletonIK3D
#@onready var skeleton_ik_3d_2: SkeletonIK3D = $player2/player/Skeleton3D/SkeletonIK3D2
#@onready var animation_player: AnimationPlayer = $player2/AnimationPlayer
#@onready var camera_zoom: AnimationPlayer = $player2/player/Skeleton3D/BoneAttachment3D/head_position/Camera3D/CAMERA_ZOOM
#
#var mouse_sensitivity = 0.001
#
#func _ready():
	#
	#skeleton_ik_3d.start()
	#skeleton_ik_3d_2.start()
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#
#func _input(event):
	#if event is InputEventMouseMotion:
		#head_rotation.rotation.y += event.relative.x*mouse_sensitivity*-1
		#head_rotation.rotation.x += event.relative.y*mouse_sensitivity
		#
	#if event is InputEventMouseButton:
		#if event.button_index == 2:
			#if event.pressed:
				#camera_zoom.play("ZOOM")
			#else :
				#camera_zoom.play_backwards("ZOOM")
