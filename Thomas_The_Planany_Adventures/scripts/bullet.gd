extends Area2D

@export var speed = 250
@export var direction = Vector2(1, 0)

func _ready():
	add_to_group("bullet")
	var timer = Timer.new()
	timer.wait_time = 1.0  # Střela zmizí po 0.5 sekundách
	timer.one_shot = true  # Spustí se jen jednou
	timer.timeout.connect(_on_timer_timeout)  # ✅ Opravené připojení signálu
	add_child(timer)  # Přidání do scény
	timer.start()  # Spuštění časovače
	
func _on_timer_timeout():
	queue_free()  # Odstranění střely

func _physics_process(delta):
	position += direction.normalized() * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.name == "killzone":
		queue_free()
