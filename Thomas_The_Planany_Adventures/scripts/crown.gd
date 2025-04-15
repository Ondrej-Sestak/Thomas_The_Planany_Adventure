extends Area2D

func _on_detection_area_body_entered(body):
	body.call_deferred("queue_free")
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
