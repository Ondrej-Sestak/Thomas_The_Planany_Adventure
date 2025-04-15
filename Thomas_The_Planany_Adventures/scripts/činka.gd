extends Area2D

@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"
@onready var sound_player =$"../../../Player/Player/Soundy/CinkaPickupsound2"

func _on_detection_area_body_entered(body: Node2D) -> void:
	Globalni.cinky += 5
	canvaslayer.naboje_visible()
	Globalni.sebeobrana = true
	sound_player.play()
	canvaslayer.naboje_count()
	queue_free()
	
