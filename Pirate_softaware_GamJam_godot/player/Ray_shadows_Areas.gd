extends Node
@onready var ray_shadow_swich_areas = $"../../player/Skeleton3D/BoneAttachment3D/Camera3D/ray_shadow_swich_Areas"
@export var shadow_companion_controller : Node3D
var detected_Area = null
func _process(delta):
	detected_Area = ray_shadow_swich_areas.get_collider()
	if detected_Area != null:
		shadow_companion_controller.area_detected(detected_Area)
