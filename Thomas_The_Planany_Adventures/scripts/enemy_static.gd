extends Node2D

var SPEED = 40  # Zvýšená rychlost pro lepší pohyb
var direction = 1

@onready var ray_cast_left = $raycast_left
@onready var ray_cast_right = $raycast_right
@onready var floor_ray_cast_left = $floor_raycast_left
@onready var floor_ray_cast_right = $floor_raycast_right
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"

func _ready() -> void:
	add_to_group("enemy")


func _on_detection_area_area_entered(area: Area2D) -> void:
	$"../../../Player/Player/Soundy/Enemy-scream".play()
	Globalni.enemy_count += 1
	canvaslayer.enemy_count()
	queue_free()
