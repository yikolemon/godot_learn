extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true

signal laser_signal(pos, direction)
signal grenade_signal(pos, direction)



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction  * 500
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed('primary action') and can_laser:
		print('shot')
		# randomly pick a marker 2d for laser
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		#emit the position
		var look_direction = (get_global_mouse_position() - position).normalized()
		laser_signal.emit(selected_laser.global_position, look_direction)
		$LaserTimer.start()
	if Input.is_action_pressed("secondary action") and can_grenade:
		print('grenade')
		can_grenade = false
		var grenade_pos = $GrenadeStartPosition.global_position
		var look_direction = (get_global_mouse_position() - position).normalized()
		grenade_signal.emit(grenade_pos, look_direction)
		$GrenadeTimer.start()



func _on_laser_time_out():
	#创建场景示例
	can_laser = true
	print('laser timer ready')
	

func _on_grenade_timer_ready():
	can_grenade = true
	print('laser timer ready')
