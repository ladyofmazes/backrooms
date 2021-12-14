extends Node2D


var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalData.json_path = 'res://assets/level01.json'
	GlobalData.command_list = []
	GlobalData.connect("commands", self, "parse_commands")
	GlobalData.connect("win", self, "win_screen")
	print('Level 1')


func parse_commands() -> void:
	for command in GlobalData.command_list:
		if 'playagame' in command:
			playagame()

func playagame() -> void:
	rng.randomize()
	var level1_number = rng.randi_range(1, 4)
	if level1_number == 1:
		option1()
	elif level1_number == 2:
		option2()
	else:
		print('Chaos chaos')

func option1() -> void:
	$Player.visible = false
	$Terror.visible = false
	$Terror1.visible = false
	$Terror2.visible = false
	$Terror3.visible = false
	$Terror4.visible = false
	$Terror5.visible = false

func option2() -> void:
	$Terror1.position += Vector2(100, 0)

func win_screen() -> void:
	$InterfaceLayer/Win.visible = true
