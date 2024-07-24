extends Node
@export var level_areas_controller : Node
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
		elif ray_col.pestle:
			gui_controller.change_cross_image("hand_pick")
		elif ray_col.pestle_put_dowm_area:
			gui_controller.change_cross_image("put_in")
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
	
func delete_item_in_left_hand():
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
			elif ray_col.pestle:
				start_Action_pick_up_pestle()
			elif ray_col.pestle_put_dowm_area:
				start_Action_put_down_pestle()

@onready var pestle = $"../../player/Skeleton3D/Right_hand_Attach/rigth_hand/pestle"
var pick_pestle = true
func start_Action_pick_up_pestle():
	pick_pestle=true
	animation_controller.pick_up_pestle()
func start_Action_put_down_pestle():
	pick_pestle=false
	animation_controller.put_down_pestle()
	
	
@export var pestle_in_table : Node3D
@export var pestle_in_hand : Node3D
func procces_pestle_pick_drop_action():
	if pick_pestle:
		print("pick_pestle")
		pestle_in_table.pestle_raycast_detector.make_visible_false()
		pestle_in_table.pestle_raycast_detector.set_pestle_no_active()
		pestle_in_hand.pestle_raycast_detector.make_visible_true()
		level_areas_controller.activate_pestle_put_down_area()
	else:
		print("drop_pestle")
		pestle_in_table.pestle_raycast_detector.make_visible_true()
		pestle_in_table.pestle_raycast_detector.set_pestle_si_active()
		pestle_in_hand.pestle_raycast_detector.make_visible_false()
		level_areas_controller.deActivate_pestle_put_down_area()
		
		




func pick_box_object_left(box_index):
	ray_col.waiting_hand = true
	ray_col.hand_node = left_hand
	ray_col.player_gui_controller = gui_controller
	animation_controller.pick_box_object_left(box_index)
	
	#left_hand.add_child(GEMA_VIOLETA_ENTERA.instantiate())



