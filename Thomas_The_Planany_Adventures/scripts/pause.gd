extends Control

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("RESET")

func resume():
	print("Resuming game")
	get_tree().paused = false
	animation_player.play_backwards("blur")
	mouse_filter = Control.MOUSE_FILTER_IGNORE  # 🚫 Ignoruje myš
	hide()


func pause():
	print("Pausing game")
	get_tree().paused = true
	animation_player.play("blur")
	mouse_filter = Control.MOUSE_FILTER_STOP  # ✅ Reaguje na myš
	show()

func toggle_pause():
	if get_tree().paused:
		resume()
	else:
		pause()

func _input(event):
	if event.is_action_pressed("pause"):
		Globalni.pause = !Globalni.pause
		print(Globalni.pause)
		toggle_pause()

func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	if Globalni.pause == true:
		get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
