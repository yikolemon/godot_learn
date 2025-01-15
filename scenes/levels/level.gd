extends Node2D

var arr : Array[int] = [123,456,789]

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
		
func _test() -> void:
	print('this is test function')


func _on_gate_player_enter_gate(body):
	print(body)
	print('player enter')


func _on_player_laser_signal(pos, direction):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# 1. update the laser position
	# 2. move the laser
	# 3. add laser instance to a node2d
	laser.rotation = direction.angle()
	laser.direction = direction
	$Porjectiles.add_child(laser)
	print('level laser')


func _on_player_grenade_signal(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Porjectiles.add_child(grenade)
	print('level grenade')
