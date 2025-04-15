extends Area2D

@onready var canvaslayer: KnightCanvas =$"../../../Player/CanvasLayer"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if Globalni.level2_quest==true:
		$"../../Soundy/Houba".play()
		$"../../Soundy/Houba2".play()
		$"../../Soundy/Houba3".play()
		$"../../Soundy/Houba4".play()
		$"../../Soundy/Houba5".play()
		$"../../Soundy/Houba6".play()
		Globalni.houby +=1
		canvaslayer.houby_count()
		if Globalni.houby==1:
			canvaslayer.houby_visible()
		queue_free()
