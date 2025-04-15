extends Node2D

@export var speed = 80.0  # Rychlost letu nepřítele
@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"

var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase and player:
		# Vypočítání směru k hráči
		var direction = (player.global_position - global_position).normalized()
		
		# Pohyb k hráči konstantní rychlostí
		global_position += direction * speed * delta  

		# Otáčení nepřítele směrem k hráči
		rotation = direction.angle()

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(body):
	if body == player: 
		player = null
		player_chase = false

func _on_bullet_catcher_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"): 
		Globalni.enemy_count +=1
		canvaslayer.enemy_count()
		queue_free()

func _ready() -> void:
	$zvuknetopyr.finished.connect(_on_zvuknetopyr_finished)

func _on_zvuknetopyr_finished() -> void:
	$zvuknetopyr.play()
