extends Area3D
@onready var mesh_node = $"../jarra_azul_ref"
@onready var jarra_azul_ray_detector :Area3D= $"."

@export var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if active == false:
		mesh_node.visible=false
		jarra_azul_ray_detector.set_collision_layer_value(1,false)


func make_visible_false():
	mesh_node.visible=false
	
func make_visible_true():
	mesh_node.visible=true
	
func set_area_active(value):
	jarra_azul_ray_detector.set_collision_layer_value(1,value)
