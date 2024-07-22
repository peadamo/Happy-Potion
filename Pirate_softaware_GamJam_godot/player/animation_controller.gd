extends Node

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
var idle_animation_node
func _ready():
	idle_animation_node = animation_tree.tree_root.get_node("Idle_animation")
	
func pick_box_object_1():
	animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	set_idle_pose_left_hand()
	
func set_idle_pose_left_hand():
	idle_animation_node.animation = "Sit_pose_idle_left"
