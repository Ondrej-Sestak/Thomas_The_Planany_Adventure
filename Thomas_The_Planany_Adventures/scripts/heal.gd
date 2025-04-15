extends Area2D

@onready var canvaslayer: KnightCanvas =$"../../Player/CanvasLayer"
@onready var sound_player =$"../../Player/Player/Soundy/Pickupsound"


func _on_detection_body_entered(body: Node2D) -> void:
	if Globalni.mode == "Mode: Hard":
		Globalni.lives +=1
		canvaslayer.heal_plus()
		sound_player.play()
		queue_free()
