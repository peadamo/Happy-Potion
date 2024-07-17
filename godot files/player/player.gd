extends Node3D

@onready var head_rotation : Marker3D = $player/Skeleton3D/Head_rotation
@onready var head_rotation_y = $player/Skeleton3D/Head_rotation/Head_rotation_y

@onready var skeleton_ik_3d = $player/Skeleton3D/SkeletonIK3D
@onready var skeleton_ik_3d_2 = $player/Skeleton3D/SkeletonIK3D2

var mouse_sensitivity = 0.001

func _ready():
	#temp
	$AnimationPlayer.play("Sit_pose")
	#temp
	
	
	
	skeleton_ik_3d.start()
	skeleton_ik_3d_2.start()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		head_rotation.rotation.y += event.relative.x*mouse_sensitivity*-1
		head_rotation.rotation.x += event.relative.y*mouse_sensitivity
		
