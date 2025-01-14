extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true

signal laser_signal
signal grenade_signal


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction  * 500
	move_and_slide()
	
	if Input.is_action_pressed('primary action') and can_laser:
		print('shot')
		can_laser = false
		laser_signal.emit()
		$LaserTimer.start()
	if Input.is_action_pressed("secondary action") and can_grenade:
		print('grenade')
		can_grenade = false
		grenade_signal.emit()
		$GrenadeTimer.start()



func _on_laser_time_out():
	can_laser = true
	print('laser timer ready')
	

func _on_grenade_timer_ready():
	can_grenade = true
	print('laser timer ready')
