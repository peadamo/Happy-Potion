extends Area3D
@onready var mesh_node = $"../jarra_azul_ref"
@onready var jarra_azul_ray_detector :Area3D= $"."

@export var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if active == false:
		mesh_node.visible=false
		jarra_azul_ray_detector.set_collision_layer_value(1,false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
