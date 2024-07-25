extends Node
@export var level_areas_controller : Node
@onready var gui_controller = $"../GUI_controller"
@onready var animation_controller = $"../animation_controller"
@onready var left_hand = $"../../player/Skeleton3D/BoneAttachment3D3/left_hand"
@onready var ray_cast_3d : RayCast3D = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/RayCast3D"
var ray_col = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	ray_col = ray_cast_3d.get_collider()
	gui_controller.update_raycast_label(ray_col)
	
	if ray_col != null:
		if ray_col.is_in_group("ingridient_box"):
			gui_controller.change_cross_image("hand_pick")
		elif ray_col.is_in_group("pestle"):
			gui_controller.change_cross_image("hand_pick")
		elif ray_col.is_in_group("pestle_put_dowm_area"):
			gui_controller.change_cross_image("put_in")
		elif ray_col.is_in_group("mortar"):
			procces_mortar_icon()
		elif ray_col.is_in_group("jarra_azul"):
			procces_jarra_azul_icon()
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
	left_hand_object = null
	
	for item in left_hand.get_children():
		item.queue_free()
			
var left_hand_free = true
var left_hand_object = null
var rigth_hand_free = true
var rigth_hand_object = null
var ingridient_in_hand = null
			
func procces_interaction_request():
	
	if ray_col != null:
		if ray_col.is_in_group("ingridient_box"):
			pick_box_object_left(ray_col.pick_box_index)
		elif ray_col.is_in_group("pestle"):
			start_Action_pick_up_pestle()
		elif ray_col.is_in_group("pestle_put_dowm_area"):
			start_Action_put_down_pestle()
		elif ray_col.is_in_group("mortar"):
			mortar_procces_interaction()
		elif ray_col.is_in_group("jarra_azul"):
			jarra_azul_procces_interaction()


#region jarra_azul
var jarra_azul_action = null
func procces_jarra_azul_icon():
	if left_hand_object == null and rigth_hand_object == null:
		gui_controller.change_cross_image("hand_pick")
		jarra_azul_action = "pick_up"
	else:
		gui_controller.change_cross_image("default")
		jarra_azul_action = null
		
func jarra_azul_procces_interaction():
	if jarra_azul_action == "pick_up":
		animation_controller.lunch_anim_JarraAzul_pickup()


#endregion


#region Mortar
var mortar_action = null
func procces_mortar_icon():
	#print("---procces_mortar_icon---")
	if left_hand_object == "ingridient":
		gui_controller.change_cross_image("put_in")
		mortar_action = "put_ingridient"
	elif rigth_hand_object == "pestle":
		gui_controller.change_cross_image("smash")
		mortar_action = "smash"
	else :
		gui_controller.change_cross_image("default")
		mortar_action = null
		

func mortar_procces_interaction():
	print("---mortar_procces_interaction---")
	match mortar_action:
		null:
			return
		"put_ingridient":
			print("mortar action, put ingridient")
			if rigth_hand_object == "pestle":
				animation_controller.put_ingridient_in_mortar_with_pestle()
			else:
				animation_controller.put_ingridient_in_mortar()
			
		"smash":
			animation_controller.lunch_anim_Action_smash_smash()
			print("mortar action, smash")
			
@export var mortar_in_table : Node3D

func procces_put_ingridient_into_the_mortar():
	print("ingridient into de mortar")
	mortar_in_table.add_ingridient(ingridient_in_hand)
	delete_item_in_left_hand()
	
func smash_ingridients_on_mortar():
	mortar_in_table.smash_all_the_shitty_ingridients()
#endregion
#region PESTLE
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
		rigth_hand_object = "pestle"
		pestle_in_table.pestle_raycast_detector.make_visible_false()
		pestle_in_table.pestle_raycast_detector.set_pestle_no_active()
		pestle_in_hand.pestle_raycast_detector.make_visible_true()
		level_areas_controller.activate_pestle_put_down_area()
	else:
		print("drop_pestle")
		rigth_hand_object = null
		pestle_in_table.pestle_raycast_detector.make_visible_true()
		pestle_in_table.pestle_raycast_detector.set_pestle_si_active()
		pestle_in_hand.pestle_raycast_detector.make_visible_false()
		level_areas_controller.deActivate_pestle_put_down_area()
		
		
#endregion



#region INGRIDIENT_BOC

func pick_box_object_left(box_index):
	ingridient_in_hand = box_index
	
	left_hand_object = "ingridient"
	ray_col.waiting_hand = true
	ray_col.hand_node = left_hand
	ray_col.player_gui_controller = gui_controller
	animation_controller.pick_box_object_left(box_index)
	
	#left_hand.add_child(GEMA_VIOLETA_ENTERA.instantiate())




#endregion
