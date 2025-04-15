extends CanvasLayer

func _ready() -> void:
	await get_tree().create_timer(7.58).timeout
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
	Globalni.listek_visible ==false
	$AudioStreamPlayer2D.finished.connect(_on_audio_stream_player_2d_finished)

func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
