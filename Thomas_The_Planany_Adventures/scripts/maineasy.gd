extends Node

const GRAVITY : float = 1000.0


func apply_gravity(entity : CharacterBody2D, delta : float) -> void:
	entity.velocity.y += GRAVITY + delta

func _enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
		
func _ready(): 
	$Player/CanvasLayer.naboje_visible()
	Globalni.houby = 0
	$Mapa/Soundy/AudioStreamPlayer2D.play
	$Mapa/Soundy/AudioStreamPlayer2D.finished.connect(_on_audio_finished)
	$Mapa/Soundy/AudioStreamPlayer2D3.play
	$Mapa/Soundy/AudioStreamPlayer2D5.play
	$Mapa/Soundy/AudioStreamPlayer2D6.play
	Globalni.aktualni_scena = "res://scenes/level2.tscn"
	Globalni.levelIdone=false
	$Player/CanvasLayer.naboje_count()
	$Player/CanvasLayer.naboje_visible()
	$Player/CanvasLayer.enemy_count()
	Globalni.aktualni_level = "level2"

func _on_audio_finished():
	$Mapa/Soundy/AudioStreamPlayer2D.play()  # Znovu spustí zvuk po dohrání
	$Mapa/Soundy/AudioStreamPlayer2D3.play()
	$Mapa/Soundy/AudioStreamPlayer2D5.play()
	$Mapa/Soundy/AudioStreamPlayer2D6.play()
