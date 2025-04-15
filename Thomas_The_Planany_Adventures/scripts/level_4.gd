extends Node

func _ready():
	Globalni.aktualni_scena = "res://scenes/level4.tscn"
	Globalni.levelIIIdone= false
	$Player/CanvasLayer.naboje_count()
	$Player/CanvasLayer.naboje_visible()
	$Player/CanvasLayer.enemy_count()
	Globalni.aktualni_level = "level4"
	$Soundy/Skola.play()
	$Soundy/Skola.finished.connect(_on_audio_finished)
	$Soundy/Skola2.play()
	$Soundy/Skola4.play()
	$Soundy/Skola3.play()
	if Globalni.mode == "Mode: Easy":
		$Heal/Heal.queue_free()

func _on_audio_finished():
	$Soundy/Skola.play()
	$Soundy/Skola2.play()
	$Soundy/Skola4.play()
	$Soundy/Skola3.play()
