extends Node
@onready var raycast_col_label :Label = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/Control/raycast_col_label"

func update_raycast_label(new_text):
	raycast_col_label.text = str(new_text)

const CROSSHAIR_117 = preload("res://GUI/mouse_icons/crosshair117.png")
const HAND_THIN_OPEN = preload("res://GUI/mouse_icons/hand_thin_open.png")
const PUT_IN = preload("res://GUI/mouse_icons/download.png")
@onready var cross = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/Control/cross"
@onready var low_left_corner_label = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/Control/Low_left_corner_label"

func set_info_label_text(new_text):
	low_left_corner_label.text = str(new_text)
	
func change_cross_image(new_image : String):
	var image_to_load
	
	match new_image:
		"default":
			image_to_load = CROSSHAIR_117
		"hand_pick":
			image_to_load = HAND_THIN_OPEN
		"put_in":
			image_to_load = PUT_IN
			
			
	cross.texture = image_to_load
