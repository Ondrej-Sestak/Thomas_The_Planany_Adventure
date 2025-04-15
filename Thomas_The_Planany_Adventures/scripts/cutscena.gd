extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("first")
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
