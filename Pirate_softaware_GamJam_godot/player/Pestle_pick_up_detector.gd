extends Area3D



func _on_area_entered(area):
	if area.is_in_group("pestle"):
		$"../Pestle_raycast_detector".make_visible()
		area.set_pestle_no_active()
