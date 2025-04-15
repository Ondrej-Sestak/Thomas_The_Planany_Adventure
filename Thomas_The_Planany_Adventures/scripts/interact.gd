extends Area2D

@onready var canvaslayer: KnightCanvas = $"../../../Player/CanvasLayer"
@onready var Interact =  $"../../../Background/Text/Interact"

func _on_body_entered(body) -> void:
	Interact.show()
	if Globalni.levelIdone==true:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_body_exited(body) -> void:
	Interact.hide()
	if Globalni.levelIdone==true:
		get_tree().change_scene_to_file("res://scenes/cutscenakolobezka.tscn")
	if Globalni.listek_visible ==true:
		canvaslayer.listek_visible()
	if Globalni.levelIIdone==true:
		get_tree().change_scene_to_file("res://scenes/cutscenavlak.tscn")
	if Globalni.levelIIIdone ==true:
		get_tree().change_scene_to_file("res://scenes/level4.tscn")
	if Globalni.levelIVdone == true:
		if Globalni.coinscollected >15:
			get_tree().change_scene_to_file("res://scenes/cutscenajizdavautefinal.tscn")
		if Globalni.coinscollected == 15:
			get_tree().change_scene_to_file("res://scenes/cutscenajizdavautefinal.tscn")
		if Globalni.coinscollected < 15:
			get_tree().change_scene_to_file("res://scenes/cutscenaautobus.tscn")
