extends Node3D

@onready var ingridient_position = $ingridient_position
@onready var triturated = $triturated

func _ready():
	triturated.visible = false
	
func load_triturated_texture():
	var ingridient = ingridient_position.get_child(-1)
	print("load texture from: ",ingridient)
	var ing_mesh :Mesh = ingridient.get_child(-1).mesh
	var ing_mat = ing_mesh.surface_get_material(0)
	
	var triturated_mesh :Mesh = triturated.get_child(-1).mesh
	triturated_mesh.surface_set_material(0,ing_mat)
	
	
func triturate_ingridient():
	
	
	ingridient_position.visible = false
	triturated.visible = true
	
