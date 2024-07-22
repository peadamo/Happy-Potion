extends Control
@onready var raycast_label: Label = $Raycast_label
@onready var center_icon: TextureRect = $center_icon

func update_raycas_collider_label(ray_collider):
	raycast_label.text = str(ray_collider)
	
	
const CROSSHAIR_117 = preload("res://GUI/cursors/crosshair117.png")
const HAND_THIN_OPEN = preload("res://GUI/cursors/hand_thin_open.png")

func set_icon(icon : String):
	var new_icon = CROSSHAIR_117
	match icon:
		"default" :
			new_icon = CROSSHAIR_117
			
		"hand_pick" :
			new_icon = HAND_THIN_OPEN

	center_icon.texture = new_icon
