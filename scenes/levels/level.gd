extends Node2D

var arr : Array[int] = [123,456,789]

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


func _on_player_laser_signal():
	print('level laser')


func _on_player_grenade_signal():
	print('level grenade')
