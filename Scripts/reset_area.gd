extends Area2D

var isInside: bool = false
@export var person: RigidBody2D

func _process(_delta: float) -> void:
	if isInside: person.reset()




func _on_body_entered(body: Node2D) -> void:
	isInside = true


func _on_body_exited(body: Node2D) -> void:
	isInside = false
