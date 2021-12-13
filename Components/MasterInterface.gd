extends Control

onready var score_label: Label = $Score

func _ready() -> void:
		GlobalData.connect("updated", self, "update_interface")
		update_interface()

func update_interface() -> void:
		score_label.text = "Score: %s" % GlobalData.score
