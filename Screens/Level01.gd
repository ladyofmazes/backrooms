extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalData.json_path = 'res://assets/level01.json'
	GlobalData.command_list = []
	GlobalData.connect("commands", self, "parse_commands")
	print('Level 1')


func parse_commands() -> void:
	for command in GlobalData.command_list:
		print(command)
