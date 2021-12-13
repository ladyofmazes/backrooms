extends Node2D

signal died
signal reset
signal updated

var score: = 100 setget set_score
var deaths: = 0 setget set_deaths
var terror: = 0 setget set_terror

func reset():
		self.score = 100
		print("Reset")
		emit_signal("reset")
		
func set_score(new_score: int) -> void:
		score = new_score
		emit_signal("updated")
		
func set_deaths(new_value: int) -> void:
		deaths = new_value
		emit_signal("died")
		
func set_terror(new_terror: int) -> void:
		terror = new_terror
		reset()
