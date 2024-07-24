extends Area3D
@export var active = false
@export var interactive : bool = false
@export var ingridient_box : bool = false
@export var pestle : bool = false
@onready var pestle_raycast_detector : Area3D = $"."
@export var pestle_put_dowm_area : bool = false
@onready var pestle_mesh = $"../Pestle"

func _ready():
	if active == false:
		print("hide pestle")
		pestle_mesh.visible= false
		pestle_raycast_detector.set_collision_layer_value(1,false)
		
		
func make_visible_true():
	pestle_mesh.visible = true
	
func make_visible_false():
	pestle_mesh.visible = false
	
func set_pestle_no_active():
	pestle_raycast_detector.set_collision_layer_value(1,false)

func set_pestle_si_active():
	pestle_raycast_detector.set_collision_layer_value(1,true)

