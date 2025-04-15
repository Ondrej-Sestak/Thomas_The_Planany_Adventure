extends CanvasLayer



func _on_respawn_pressed():
	Globalni.enemy_count = 0
	if Globalni.mode == "Mode: Easy":
		get_tree().change_scene_to_file(Globalni.aktualni_scena)
	elif Globalni.mode =="Mode: Hard":
		Globalni.lives -= 1
		Globalni.coinscollected = 0
		if Globalni.lives >0:
			get_tree().change_scene_to_file(Globalni.aktualni_scena)
		elif Globalni.lives ==0:
			Globalni.cinky = 0
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
	


func _on_quit_pressed():
	get_tree().quit()

@onready var timer_label = $MarginContainer/VBoxContainer/Label2

# Funkce pro formátování času na MM:SS
func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var secs = int(seconds) % 60
	return str(minutes).pad_zeros(2) + ":" + str(secs).pad_zeros(2)

func _ready():
	# Předpokládám, že proměnná Globalni.current_time existuje a obsahuje čas v sekundách
	timer_label.text = format_time(Globalni.current_time)
