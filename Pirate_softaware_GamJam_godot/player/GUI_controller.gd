extends Node
@onready var raycast_col_label :Label = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/Control/raycast_col_label"

func update_raycast_label(new_text):
	raycast_col_label.text = str(new_text)

const CROSSHAIR_117 = preload("res://GUI/mouse_icons/crosshair117.png")
const HAND_THIN_OPEN = preload("res://GUI/mouse_icons/hand_thin_open.png")
@onready var cross = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/Control/cross"


func change_cross_image(new_image : String):
	var image_to_load
	
	match new_image:
		"default":
			image_to_load = CROSSHAIR_117
		"hand_pick":
			image_to_load = HAND_THIN_OPEN
			
	cross.texture = image_to_load
