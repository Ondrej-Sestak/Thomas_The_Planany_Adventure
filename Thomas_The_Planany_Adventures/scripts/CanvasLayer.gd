extends CanvasLayer
class_name KnightCanvas

@onready var timer_label = $TimerLabel
@onready var game_timer = $GameTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.hide()
	$CoinCount.text = "Coins: " + str(Globalni.coinscollected) + Globalni.max_coin
	$LiveCounter.text = "Lives: " + str(Globalni.lives)
	$Mode.text = Globalni.mode
	# Nastavení timeru, aby tickoval každou sekundu
	game_timer.set_wait_time(1.0)
	game_timer.start()
	
	# Připojení signálu timeout, který se zavolá každou sekundu
	game_timer.timeout.connect(_on_GameTimer_timeout)

# Funkce se volá každou sekundu, když timer tickne
func _on_GameTimer_timeout():
	# Přičtení jedné sekundy k aktuálnímu času
	Globalni.current_time += 1.0
	# Aktualizace textu v labelu pro zobrazení času ve formátu MM:SS
	timer_label.text = "Time: " + format_time(Globalni.current_time)

# Funkce pro formátování času na MM:SS
func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var secs = int(seconds) % 60
	return str(minutes).pad_zeros(2) + ":" + str(secs).pad_zeros(2)

# Funkce pro sbírání coinů
func coin_collected():
	Globalni.coinscollected += 1
	$CoinCount.text = "Coins: " + str(Globalni.coinscollected) + Globalni.max_coin

func naboje_count():
	$"Náboje".text = "Náboje: " + str(Globalni.cinky)

func naboje_visible():
	$"Náboje".show()

func heal_plus():
	$LiveCounter.text = "Lives: " + str(Globalni.lives)

func listek_visible():
	$Sprite2D.show()

func enemy_count():
	$"Zabito nepřátel".text = "Zabito nepřátel: "+str(Globalni.enemy_count)

func houby_count():
	$"Nasbíráno hub".text = "Nasbíráno hub: "+str(Globalni.houby)+"/10"

func houby_visible():
	$"Nasbíráno hub".visible = not $"Nasbíráno hub".visible
