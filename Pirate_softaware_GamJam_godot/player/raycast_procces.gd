extends Node
@onready var gui_controller = $"../GUI_controller"
@onready var animation_controller = $"../animation_controller"
@onready var left_hand = $"../../player/Skeleton3D/BoneAttachment3D3/left_hand"

@onready var ray_cast_3d : RayCast3D = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/RayCast3D"
var ray_col = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ray_col = ray_cast_3d.get_collider()
	gui_controller.update_raycast_label(ray_col)
	
	if ray_col != null:
		if ray_col.interactive:
			gui_controller.change_cross_image("hand_pick")
	else:
		gui_controller.change_cross_image("default")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			pick_box_object_1()
			
			
const GEMA_VIOLETA_ENTERA = preload("res://assets/3d/ingridients/gema_violeta_entera.glb")			
func pick_box_object_1():
	animation_controller.pick_box_object_1()
	
	left_hand.add_child(GEMA_VIOLETA_ENTERA.instantiate())
