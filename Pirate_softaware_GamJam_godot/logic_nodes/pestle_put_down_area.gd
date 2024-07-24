extends Area3D
@onready var pestle_put_down_area : Area3D = $"."
@export var active = false
@export var interactive : bool = false
@export var ingridient_box : bool = false
@export var pestle : bool = false
@export var pestle_put_dowm_area : bool = false


func turn_on():
	pestle_put_down_area.set_collision_layer_value(1,true)
func turn_off():
	pestle_put_down_area.set_collision_layer_value(1,false)
