extends CanvasLayer

func _ready() -> void:
	await get_tree().create_timer(7.5).timeout
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
