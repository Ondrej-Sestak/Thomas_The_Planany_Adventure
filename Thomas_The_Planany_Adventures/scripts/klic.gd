extends Area2D


func _on_detection_area_body_entered(body: Node2D) -> void:
	$"../../../Soundy/klic".play()
	$"../../DverePuda".queue_free()
	$"../../../Background/Zednadrazi/StaticBody2D/Dvere".queue_free()
	queue_free()
