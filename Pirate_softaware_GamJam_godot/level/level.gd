extends Node3D
@onready var areas_controllet = $scripts/areas_controllet


# Called when the node enters the scene tree for the first time.
func _ready():
	$player.visible=true
	$player/player/Skeleton3D/BoneAttachment3D/Camera3D/sahder.visible=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
