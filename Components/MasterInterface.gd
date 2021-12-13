extends Control

onready var score_label: Label = $Score
onready var death_screen: ColorRect = $DeathScreen
onready var death_label: Label = $DeathScreen/DeathLabel

const DEAD = "You Died"

func _ready() -> void:
		GlobalData.connect("updated", self, "update_interface")
		GlobalData.connect("died", self, "_on_Player_died")
		update_interface()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		death_screen.visible = false

func update_interface() -> void:
		score_label.text = "Score: %s" % GlobalData.score

func _on_Player_died() -> void:
	death_screen.visible = true
