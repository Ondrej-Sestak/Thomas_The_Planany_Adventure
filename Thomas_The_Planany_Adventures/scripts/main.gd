extends Node

const GRAVITY : float = 1000.0
@onready var Interact =$Background/Text/Interact/Interact
@onready var canvaslayer: KnightCanvas =$Player/CanvasLayer

func apply_gravity(entity : CharacterBody2D, delta : float) -> void:
	entity.velocity.y += GRAVITY + delta

func _ready():
	Globalni.levelIVdone= false
	$Soundy/pozadi.finished.connect(_on_audio_finished)
	Globalni.aktualni_scena = "res://scenes/level1.tscn"
	Globalni.tabulevyplnena = false
	Globalni.aktualni_level = "level1"
	Globalni.current_time = 0.0
	Globalni.coinscollected = 0
	if Globalni.sebeobrana == true:
		canvaslayer.naboje_visible()
	if Globalni.levelIdone == true:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
	if Globalni.mode == "Mode: Easy":
		$Heal.visible = false
	
func _on_audio_finished():
	$Soundy/pozadi.play()
	$Soundy/pozadi2.play()
	$Soundy/pozadi3.play()
	$Soundy/pozadi4.play()
	$Soundy/pozadi5.play()
