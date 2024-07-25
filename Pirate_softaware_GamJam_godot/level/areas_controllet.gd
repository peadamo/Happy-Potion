extends Node
@onready var pestle_put_down_area : Area3D = $"../../Logic Areas/Put_down_Pestle_Area/Pestle_put_down_area"
@onready var jarra_azul_put_down_area :Area3D= $"../../Logic Areas/jarra_Azul_put_down_area"

func _ready():
	on_off_area_jarra_azul_put_down_area(false)

func activate_pestle_put_down_area():
	pestle_put_down_area.turn_on()
func deActivate_pestle_put_down_area():
	pestle_put_down_area.turn_off()

func on_off_area_jarra_azul_put_down_area(value):
	jarra_azul_put_down_area.set_collision_layer_value(1,value)
