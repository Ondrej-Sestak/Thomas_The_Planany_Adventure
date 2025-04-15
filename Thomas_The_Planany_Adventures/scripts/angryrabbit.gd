extends CharacterBody2D


var SPEED = 40  # Zvýšená rychlost pro lepší pohyb
var direction = 1

@onready var ray_cast_left = $raycast_left
@onready var ray_cast_right = $raycast_right
@onready var floor_ray_cast_left = $floor_raycast_left
@onready var floor_ray_cast_right = $floor_raycast_right
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"

func _on_detection_area_body_entered(body):
	SPEED = 50  # Rychlejší pohyb při detekci hráče

func _on_detection_area_body_exited(body):
	SPEED = 40  # Normální rychlost, když hráč odejde

func _ready() -> void:
	add_to_group("enemy")
	if Globalni.aktualni_level == "level2":
		$zvukkralik.finished.connect(_on_zvukkralik_finished)


func _on_detection_area_area_entered(area: Area2D) -> void:
	Globalni.enemy_count += 1
	canvaslayer.enemy_count()
	$"../../../Player/Player/Soundy/kralik-scream".play()
	queue_free()

func _on_zvukkralik_finished() -> void:
	$zvukkralik.play()
