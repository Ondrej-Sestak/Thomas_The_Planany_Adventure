extends Area2D


func _on_detection_area_body_exited(body: Node2D) -> void:
	if Globalni.tabulevyplnena == true:
		$TabulePrazdna.hide()
		$TabuleVyplnena.show()
