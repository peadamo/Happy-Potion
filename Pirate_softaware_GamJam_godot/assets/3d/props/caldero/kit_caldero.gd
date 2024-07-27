extends Node3D
@onready var caldero_balanceo = $caldero_balanceo

var water_max_pos = Vector3(0,-1.351,0)
var water_max_scale = Vector3(1,1,1)

var 

var water_min_pos = Vector3(0,-1.48,0)
var water_min_scale = Vector3(0.1,0.1,0.1)


# Called when the node enters the scene tree for the first time.
func _ready():
	caldero_balanceo.play("move")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
