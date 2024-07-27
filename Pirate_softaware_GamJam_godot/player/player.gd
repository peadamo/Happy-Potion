extends Node3D

@onready var pestle = $player/Skeleton3D/Right_hand_Attach/rigth_hand/pestle
@onready var liquid_jau = $player/Skeleton3D/Right_hand_Attach/marker_blue_jar/liquid_jau

# Called when the node enters the scene tree for the first time.
func _ready():
	#pestle.visible=false
	$AnimationTree.active = true
	liquid_jau.emitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func lalala():
	print("please work")
