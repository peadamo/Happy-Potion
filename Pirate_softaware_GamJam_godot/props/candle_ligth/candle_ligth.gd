extends Node3D


@export var noise : NoiseTexture3D
var time_passed : float = 0.0
@onready var omni_light_3d : OmniLight3D= $OmniLight3D
var lamp_move_value = 0.01 
var random:float

func _ready():
	random = randf()*1000
	time_passed+=random

func _process(delta):
	time_passed += delta/3
	
	var sampled_noise = noise.noise.get_noise_1d(time_passed)
	sampled_noise = abs(sampled_noise)+0.2
	omni_light_3d.light_energy = sampled_noise/4
	
	var color = noise.color_ramp.sample(sampled_noise)
	omni_light_3d.light_color = color
	omni_light_3d.position.x = 0+sampled_noise*lamp_move_value
	omni_light_3d.position.y = 0+sampled_noise*lamp_move_value
	omni_light_3d.position.z = 0+sampled_noise*lamp_move_value*-1
	
	
	
	
	
