extends Area3D
@export var level_areas_controller : Node

var has_pestle = false


func _on_area_entered(area):
	if area.is_in_group("pestle"):
		if has_pestle == false:
			has_pestle = true
			$"../Pestle_raycast_detector".make_visible()
			area.set_pestle_no_active()
			level_areas_controller.activate_pestle_put_down_area()
		else:
			has_pestle = false
			$"../Pestle_raycast_detector".make_not_visible()
			area.set_pestle_si_active()
			level_areas_controller.deActivate_pestle_put_down_area()
