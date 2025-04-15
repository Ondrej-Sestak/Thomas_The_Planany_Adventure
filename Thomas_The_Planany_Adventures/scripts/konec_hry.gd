extends Control



func _on_znovu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_konec_pressed() -> void:
	get_tree().quit()
