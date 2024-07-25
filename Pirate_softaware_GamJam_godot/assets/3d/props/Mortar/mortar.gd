extends Node3D


var ingridients_model : Array =["res://assets/3d/ingridients/00_ING_gem_purple.glb","res://assets/3d/ingridients/01_ING_mushroom_morcilla.glb","res://assets/3d/ingridients/02_ING_mushroom_Liberty Cap.glb","res://assets/3d/ingridients/03_ING_trunpetflower.glb","res://assets/3d/ingridients/04_ING_mushroom_death_trumpet.glb","res://assets/3d/ingridients/05_ING_gem_blue.glb","res://assets/3d/ingridients/05_ING_gem_blue.glb","res://assets/3d/ingridients/07_ING_bird_head.glb","res://assets/3d/ingridients/08_ING_mushroom_earthball.glb","res://assets/3d/ingridients/09_ING_gem_green.glb","res://assets/3d/ingridients/10_ING_mushroom_porcini.glb","res://assets/3d/ingridients/11_ING_mushroom_puff.glb","res://assets/3d/ingridients/11_ING_mushroom_puff.glb","res://assets/3d/ingridients/13_ING_gem_red.glb","res://assets/3d/ingridients/14_ING_seashell.glb"]
@onready var ingridients_container = $ingridients_container
const ON_MORTAR_INGRIDIENT = preload("res://assets/3d/props/Mortar/on_mortar_ingridient.tscn")

func add_ingridient(ingridient_in_hand):
	var item = load(ingridients_model[ingridient_in_hand]).instantiate()
	ingridients_container.add_child(ON_MORTAR_INGRIDIENT.instantiate())
	var new_ingridient_container = ingridients_container.get_child(-1)
	new_ingridient_container.ingridient_position.add_child(item)
	new_ingridient_container.load_triturated_texture()
	update_item_rotation()
	
	
	
	
	
func update_item_rotation():
	for index in ingridients_container.get_child_count():
		var item = ingridients_container.get_child(index)
		item.rotation.y = deg_to_rad(360/ingridients_container.get_child_count())*index
	
var max_heigth = 0.03
var max_scale = 0.4
func smash_all_the_shitty_ingridients():
	print("all the ingridients are smashed")
	for index in ingridients_container.get_child_count():
		var item = ingridients_container.get_child(index)
		item.triturate_ingridient()
		item.position.y = max_heigth/5*ingridients_container.get_child_count()
		if item.position.y > 0.03:
			item.position.y = 0.03
			
		var new_scale = 1.0 + max_scale/5*ingridients_container.get_child_count()
		if new_scale > 1.4:
			new_scale = 1.4
			
		item.scale = Vector3(new_scale,new_scale,new_scale)
