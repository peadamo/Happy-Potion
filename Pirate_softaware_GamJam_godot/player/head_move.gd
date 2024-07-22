extends Node
@onready var skeleton_ik_3d : SkeletonIK3D = $"../../player/Skeleton3D/SkeletonIK3D"
@onready var skeleton_ik_3d_2 : SkeletonIK3D = $"../../player/Skeleton3D/SkeletonIK3D2"
@onready var head_rotation = $"../../head_rotation"
@onready var camera_3d = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D"
@onready var head_position = $"../../player/Skeleton3D/BoneAttachment3D2/head_position"

var mouse_sensitivity = 0.001

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	skeleton_ik_3d.start()
	skeleton_ik_3d_2.start()


func _input(event):
	if event is InputEventMouseMotion:
		head_rotation.rotation.y += event.relative.x*mouse_sensitivity*-1
		head_rotation.rotation.x += event.relative.y*mouse_sensitivity
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	head_rotation.global_position = head_position.global_position
	pass
