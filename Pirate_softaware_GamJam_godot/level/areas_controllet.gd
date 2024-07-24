extends Node
@onready var pestle_put_down_area : Area3D = $"../../Logic Areas/Put_down_Pestle_Area/Pestle_put_down_area"

func activate_pestle_put_down_area():
	pestle_put_down_area.turn_on()
func deActivate_pestle_put_down_area():
	pestle_put_down_area.turn_off()
