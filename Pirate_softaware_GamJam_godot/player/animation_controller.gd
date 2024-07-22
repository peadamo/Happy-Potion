extends Node

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
var idle_animation_node
var one_shot_animation_node

func _ready():
	idle_animation_node = animation_tree.tree_root.get_node("Idle_animation")
	one_shot_animation_node = animation_tree.tree_root.get_node("One_shot_animation")
	
@onready var pick_box_left_hand_animations : Array = [
	"Action_pick_box_01_left",
	"Action_pick_box_02_left",
	"Action_pick_box_03_left",
	"Action_pick_box_04_left",
	"Action_pick_box_05_left",
	"Action_pick_box_06_left",
	"Action_pick_box_07_left",
	"Action_pick_box_08_left",
	"Action_pick_box_09_left",
	"Action_pick_box_10_left",
	"Action_pick_box_11_left",
	"Action_pick_box_12_left",
	"Action_pick_box_13_left",
	"Action_pick_box_14_left",
	"Action_pick_box_15_left"]
var can_shot_anim = true
func pick_box_object_left(box_index):
	if can_shot_anim:
		can_shot_anim=false
		one_shot_animation_node.animation = pick_box_left_hand_animations[box_index]
		animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		set_idle_pose_left_hand()
	
func set_idle_pose_left_hand():
	idle_animation_node.animation = "Sit_pose_idle_left"


func _on_animation_tree_animation_finished(anim_name):
	can_shot_anim = true
	print(anim_name)
