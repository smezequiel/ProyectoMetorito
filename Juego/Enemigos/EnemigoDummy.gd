extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		body.destruir()
