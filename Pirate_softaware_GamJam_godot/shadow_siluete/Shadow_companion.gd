extends Node3D

@onready var shadow_siluette = $shadow_siluette
@onready var shw_mrk_over_book = $shw_mrk_over_book
@onready var shw_mrk_top = $shw_mrk_top
@onready var shw_mrk_left_ingridient = $shw_mrk_left_ingridient
@onready var shw_mrk_rigth_ingridient = $shw_mrk_rigth_ingridient

@onready var dest = shw_mrk_over_book

var actual_area = null

func area_detected(detected_area):
	if actual_area != detected_area:
		actual_area = detected_area
		update_shadow_position(actual_area)

var move_shadow = false
var speed = 0.01
var distance = 100.0
var pos_direction
var iterations

var scale_steps
var rotation_steps
var rot_normal = true
func update_shadow_position(new_area):
	if new_area == null:
		dest=shw_mrk_over_book
	else:
		if new_area.is_in_group("book_area"):
			dest=shw_mrk_top
		elif new_area.is_in_group("test_area"):
			dest=shw_mrk_over_book
		elif new_area.is_in_group("left_ingridient_area"):
			dest=shw_mrk_left_ingridient
		elif new_area.is_in_group("rigth_ingridient_area"):
			dest=shw_mrk_rigth_ingridient
			
			
			
			
	distance = shadow_siluette.global_position.distance_to(dest.global_position)
	pos_direction = shadow_siluette.global_position.direction_to(dest.global_position)
	iterations = distance/speed
	
	
	scale_steps = (dest.scale - shadow_siluette.scale)/iterations
	
	var rotation_1 = dest.rotation - shadow_siluette.rotation
		
	rotation_steps = rotation_1/iterations
	
	shadow_siluette.rotation = dest.rotation
	
	move_shadow=true
	#shadow_siluette.animation_player.play("move")
#borrar esto




# Called every frame. 'delta' is the elapsed time since the previous frame.
var real_speed = 0.2
func _process(delta):
	if move_shadow:
		if iterations>0:
			shadow_siluette.global_position+=pos_direction*speed*real_speed
			shadow_siluette.scale+=scale_steps*real_speed
			#shadow_siluette.rotation+=rotation_steps*real_speed
			iterations -= 1*real_speed
		else :
			move_shadow = false

