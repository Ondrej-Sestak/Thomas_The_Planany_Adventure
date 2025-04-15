extends Node2D

var SPEED = 40  # Zvýšená rychlost pro lepší pohyb
var direction = 1

@onready var ray_cast_left = $raycast_left
@onready var ray_cast_right = $raycast_right
@onready var floor_ray_cast_left = $floor_raycast_left
@onready var floor_ray_cast_right = $floor_raycast_right
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"


func _process(delta):
	# Otočení při nárazu do zdi
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
	elif ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	
	# Otočení při chybějící podlaze
	elif not floor_ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	elif not floor_ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false

	# Pohyb se správným delta
	position.x += direction * SPEED * delta

func _on_detection_area_body_entered(body):
	SPEED = 50  # Rychlejší pohyb při detekci hráče

func _on_detection_area_body_exited(body):
	SPEED = 40  # Normální rychlost, když hráč odejde

func _ready() -> void:
	add_to_group("enemy")
	$npc.finished.connect(_on_npc_finished)


func _on_detection_area_area_entered(area: Area2D) -> void:
	Globalni.enemy_count += 1
	canvaslayer.enemy_count()
	queue_free()

func _on_npc_finished() -> void:
	$npc.play()
