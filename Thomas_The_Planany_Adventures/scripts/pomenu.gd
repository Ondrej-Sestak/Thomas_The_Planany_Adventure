extends Control



func _on_hard_pressed():
	get_tree().change_scene_to_file("res://scenes/cutscena.tscn")
	Globalni.current_time = 0
	Globalni.coinscollected = 0
	Globalni.aktualni_scena = "res://scenes/level1.tscn"
	Checkpoint.last_position = null
	Globalni.max_coin = ""
	Globalni.mode = "Mode: Hard"
	Globalni.lives = 3


func _on_easy_pressed():
	#get_tree().change_scene_to_file("res://scenes/level1.tscn")
	get_tree().change_scene_to_file("res://scenes/cutscena.tscn")
	Globalni.current_time = 0
	Globalni.coinscollected = 0
	Globalni.aktualni_scena = "res://scenes/level1.tscn"
	Checkpoint.last_position = null
	Globalni.max_coin = "" 
	Globalni.mode = "Mode: Easy"
	Globalni.lives = "unlimited"
	
func _ready() -> void:
	Globalni.cinky=0
	Globalni.enemy_count = 0
	$znelka.finished.connect(_on_audio_finished)
	
func _on_audio_finished():
	$znelka.play()
