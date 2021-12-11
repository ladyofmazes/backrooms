extends Control

onready var score_label: Label = $Score

func _ready() -> void:
		GlobalData.connect("updated", self, "update_interface")
		GlobalData.connect("died", self, "_on_Player_died")
		GlobalData.connect("reset", self, "_on_Player_reset")
		update_interface()

func update_interface() -> void:
		score_label.text = "Score: %s" % GlobalData.score
