extends Node

@onready var animation_tree: AnimationTree = $"../../player2/AnimationTree"

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				shot_anim()


func shot_anim():
	animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
