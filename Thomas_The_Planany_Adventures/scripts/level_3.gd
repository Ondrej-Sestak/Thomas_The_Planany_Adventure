extends Node

func _ready():
	Globalni.aktualni_scena = "res://scenes/level3.tscn"
	Globalni.levelIIdone=false
	$Player/CanvasLayer.naboje_count()
	$Player/CanvasLayer.naboje_visible()
	$Player/CanvasLayer.enemy_count()
	Globalni.aktualni_level = "level3"
	Globalni.listek_visible=false
	$Soundy/nadrazi.finished.connect(_on_audio_finished_nadrazi)
	$Soundy/mexickytrh.finished.connect(_on_audio_finished_mexickytrh)
	$Soundy/silnice.finished.connect(_on_audio_finished_silnice)

func _on_audio_finished_nadrazi():
	$Soundy/nadrazi.play()
	
func _on_audio_finished_mexickytrh():
	$Soundy/mexickytrh.play()
	
func _on_audio_finished_silnice():
	$Soundy/silnice.play()
