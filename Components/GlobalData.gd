extends Node2D

signal died
signal win
signal reset
signal reboot
signal updated
signal text_input
signal json_data
signal commands

var score: = 100: set = set_score
var wins: = 0: set = set_wins
var deaths: = 0: set = set_deaths
var terror: = 0: set = set_terror
var insanity_distance: = 300: set = set_insanity_distance
var terror_threshold: = 100: set = set_terror_threshold

var computer_input: = '': set = set_computer_input
var json_path: = '': set = set_json_path
var command_list: = []: set = set_command_list

func death_reset():
		self.score = 100
		emit_signal("reset")

func death_reboot():
		self.deaths = 0
		self.terror = 0
		self.insanity_distance = 300
		emit_signal("reboot")
		
func set_score(new_score: int) -> void:
		set_terror(terror + abs(score - new_score))
		score = new_score
		emit_signal("updated")

func set_wins(new_wins: int) -> void:
		wins = new_wins
		emit_signal("win")

func set_computer_input(new_computer_input: String) -> void:
		computer_input = new_computer_input
		emit_signal("text_input")

func set_json_path(new_json_path: String) -> void:
		json_path = new_json_path
		emit_signal("json_data")

func set_command_list(new_command_list: Array) -> void:
		command_list = new_command_list
		if 'reboot' in command_list:
			death_reboot()
		emit_signal("commands")
		
func set_insanity_distance(new_insanity_distance: int) -> void:
		insanity_distance = new_insanity_distance
		
func set_terror_threshold(new_terror_threshold: int) -> void:
		terror_threshold = new_terror_threshold
	
func set_deaths(new_value: int) -> void:
		deaths = new_value
		death_reset()
		emit_signal("died")
		
func set_terror(new_terror: int) -> void:
		terror = new_terror
		print(terror)
