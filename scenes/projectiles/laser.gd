extends Area2D

#将变量暴露给检查器
@export var speed : int = 1000
var direction : Vector2 = Vector2.UP

func _process(delta: float) -> void:
	position += direction * speed * delta
