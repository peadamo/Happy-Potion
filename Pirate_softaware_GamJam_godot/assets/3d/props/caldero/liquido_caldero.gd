extends Node3D

@onready var liquido_rotation = $liquido_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	liquido_rotation.play("rotate")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
