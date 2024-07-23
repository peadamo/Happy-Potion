extends Node

@onready var animation_tree : AnimationTree = $"../../AnimationTree"
var idle_animation_node
var next_idle_anim = "Sit_pose_idle"
var one_shot_animation_node
@onready var idle_anim_delay = $idle_anim_delay

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
		next_idle_anim = "Sit_pose_idle_left_hand"
		idle_anim_delay.start()
		
	

	

func lunch_anima_discard_object_in_left_hand():
	one_shot_animation_node.animation = "Action_discard_object_in_left_hand"
	animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	next_idle_anim = "Sit_pose_idle"
	idle_anim_delay.start()
	

func _on_animation_tree_animation_finished(anim_name):
	can_shot_anim = true
	print(anim_name)


func _on_idle_anim_delay_timeout():
	idle_animation_node.animation = next_idle_anim
	
	
	
func pick_up_pestle():
	one_shot_animation_node.animation = "Action_pick_up_pestle"
	animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	next_idle_anim = "Action_pick_up_pestle"
	idle_anim_delay.start()
