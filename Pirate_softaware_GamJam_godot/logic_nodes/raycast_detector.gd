extends Area3D

@export var interactive : bool = false
@export var ingridient_box : bool = false
@export var pestle : bool = false
@export var pick_box_index :int = 0
@export var pestle_put_dowm_area : bool = false
@export var mortar : bool = false
@export var preferred_hand_left : bool = false
@export var preferred_hand_rigth : bool = false
var player_gui_controller
var hand_node
var waiting_hand = false

func _on_area_entered(area):
	if waiting_hand:
		if area.is_in_group("player_left_hand"):
			waiting_hand=false
			print("ingridient slot: ",pick_box_index," - se recoje objeto")
			hand_node.add_child(load(ingridients_model[pick_box_index]).instantiate())
			player_gui_controller.set_info_label_text("Press key X to discard item")


var ingridients_model : Array =[
"res://assets/3d/ingridients/00_ING_gem_purple.glb",
"res://assets/3d/ingridients/01_ING_mushroom_morcilla.glb",
"res://assets/3d/ingridients/02_ING_mushroom_Liberty Cap.glb",
"res://assets/3d/ingridients/03_ING_trunpetflower.glb",
"res://assets/3d/ingridients/04_ING_mushroom_death_trumpet.glb",
"res://assets/3d/ingridients/05_ING_gem_blue.glb",
"res://assets/3d/ingridients/05_ING_gem_blue.glb",
"res://assets/3d/ingridients/07_ING_bird_head.glb",
"res://assets/3d/ingridients/08_ING_mushroom_earthball.glb",
"res://assets/3d/ingridients/09_ING_gem_green.glb",
"res://assets/3d/ingridients/10_ING_mushroom_porcini.glb",
"res://assets/3d/ingridients/11_ING_mushroom_puff.glb",
"res://assets/3d/ingridients/11_ING_mushroom_puff.glb",
"res://assets/3d/ingridients/13_ING_gem_red.glb",
"res://assets/3d/ingridients/14_ING_seashell.glb"]
