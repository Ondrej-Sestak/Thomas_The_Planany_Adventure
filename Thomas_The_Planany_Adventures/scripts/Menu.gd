extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/pomenu.tscn")
	

func _on_quit_pressed():
	get_tree().quit()

func _ready() -> void:
	$znelka.finished.connect(_on_audio_finished)
	
func _on_audio_finished():
	$znelka.play()
