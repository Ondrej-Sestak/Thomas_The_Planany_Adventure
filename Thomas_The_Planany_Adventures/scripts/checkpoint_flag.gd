extends Area2D

func _on_body_entered(body):
	Checkpoint.last_position = global_position
	$Sprite2D.visible = false
	$Sprite2D2.visible = true
