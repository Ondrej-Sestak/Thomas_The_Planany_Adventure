extends Area2D

@onready var canvaslayer: KnightCanvas = $"../../Player/CanvasLayer"
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	canvaslayer.coin_collected()
	animation_player.play("pickup")
