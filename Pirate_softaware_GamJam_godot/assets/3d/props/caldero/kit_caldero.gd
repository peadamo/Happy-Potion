extends Node3D
@onready var caldero_balanceo = $caldero_balanceo
@onready var liquido_caldero = $kit_caldero/liquido_caldero


var water_pos : Array = [Vector3(0,-1.48,0),Vector3(0,-1.437,0),Vector3(0,-1.394,0),Vector3(0,-1.351,0)]
var water_scale : Array = [Vector3(0.1,0.1,0.1),Vector3(0.775,0.775,0.775),Vector3(0.94,0.94,0.94),Vector3(1,1,1)]


var actual_value = 0
var steps = 100.0
var pos_step
var scale_step
var free_steps 
var update = false

func _ready():
	caldero_balanceo.play("move")

func add_water():
	var new_value = actual_value+1
	
	print(new_value)
	if new_value > 3:
		return
	else:
		var pos_dif = water_pos[new_value]-water_pos[actual_value]
		pos_step = pos_dif/steps
		var scale_dif = water_scale[new_value]-water_scale[actual_value]
		print(scale_dif)
		
		scale_step = scale_dif/steps
		print(scale_step)
		free_steps = steps
		update = true
		actual_value+=1
		
func _process(delta):
	if update:
		free_steps-=1
		if free_steps > 0:
			liquido_caldero.position+=pos_step
			liquido_caldero.scale+=scale_step
		else:
			update = false
