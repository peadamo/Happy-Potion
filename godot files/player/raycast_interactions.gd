extends Node
var col_object = null
@onready var ray_cast_3d: RayCast3D = $"../../player2/player/Skeleton3D/BoneAttachment3D/head_position/Camera3D/RayCast3D"
@onready var player_gui: Control = $"../../player2/player/Skeleton3D/BoneAttachment3D/head_position/Camera3D/Player_GUI"



func _process(delta: float) -> void:
	
	col_object = ray_cast_3d.get_collider()
	
	player_gui.update_raycas_collider_label(col_object)
	
	if col_object == null:
		player_gui.set_icon("default")
	else:
		player_gui.set_icon("hand_pick")
		
	
	
