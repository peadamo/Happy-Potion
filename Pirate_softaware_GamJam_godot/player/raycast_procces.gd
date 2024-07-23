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
		if ray_col.ingridient_box:
			gui_controller.change_cross_image("hand_pick")
	else:
		gui_controller.change_cross_image("default")



func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			procces_interaction_request()
			
	if Input.is_action_just_pressed("discard_item_in_hand"):
		delet_item_in_left_hand()
		
func delet_item_in_left_hand():
	gui_controller.set_info_label_text("")
	
	animation_controller.lunch_anima_discard_object_in_left_hand()
	for item in left_hand.get_children():
		item.queue_free()
			
var left_hand_free = true
var left_hand_object = null
var rigth_hand_free = true
var rigth_hand_object = null

			
func procces_interaction_request():
	
	if ray_col != null:
		if ray_col.interactive:
			if ray_col.ingridient_box:
				pick_box_object_left(ray_col.pick_box_index)
			





func pick_box_object_left(box_index):
	ray_col.waiting_hand = true
	ray_col.hand_node = left_hand
	ray_col.player_gui_controller = gui_controller
	animation_controller.pick_box_object_left(box_index)
	
	#left_hand.add_child(GEMA_VIOLETA_ENTERA.instantiate())



