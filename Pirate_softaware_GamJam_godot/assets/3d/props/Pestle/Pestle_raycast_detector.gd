extends Area3D
@export var active = false
@export var interactive : bool = false
@export var ingridient_box : bool = false
@export var pestle : bool = false
@onready var pestle_mesh = $".."
@onready var pestle_raycast_detector : Area3D = $"."
func _ready():
	if active == false:
		print("hide pestle")
		pestle_mesh.visible= false
		pestle_raycast_detector.set_collision_layer_value(1,false)
	else:
		add_to_group("pestle")


func make_visible():
	pestle_mesh.visible= true


func set_pestle_no_active():
		active = false
		pestle_mesh.visible= false
		pestle_raycast_detector.set_collision_layer_value(1,false)
		
func set_pestle_si_active():
		active = true
		pestle_mesh.visible= true
		pestle_raycast_detector.set_collision_layer_value(1,true)
