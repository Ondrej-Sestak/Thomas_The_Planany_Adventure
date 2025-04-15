extends CanvasLayer

@onready var timer_label = $MarginContainer/TimerLabel

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/pomenu.tscn")
	Checkpoint.last_position = null

func _on_quit_pressed():
	Checkpoint.last_position = null
	get_tree().quit()

# Funkce pro formátování času na MM:SS
func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var secs = int(seconds) % 60
	return str(minutes).pad_zeros(2) + ":" + str(secs).pad_zeros(2)

func _ready():
	# Předpokládám, že proměnná Globalni.current_time existuje a obsahuje čas v sekundách
	timer_label.text = format_time(Globalni.current_time)
