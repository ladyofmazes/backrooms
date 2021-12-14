extends Control

onready var score_label: Label = $Score
onready var death_screen: ColorRect = $DeathScreen
onready var death_label: Label = $DeathScreen/DeathLabel
onready var dialogue_box: ColorRect = $DialogueBox
onready var dialogue: Label = $DialogueBox/Dialogue

func _ready() -> void:
		GlobalData.connect("updated", self, "update_interface")
		GlobalData.connect("text_input", self, "show_computer_dialogue")
		GlobalData.connect("died", self, "_on_Player_died")
		update_interface()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		death_screen.visible = false
		dialogue_box.visible = false

func update_interface() -> void:
	score_label.text = "Score: %s" % GlobalData.score
		
func show_computer_dialogue() -> void:
	dialogue_box.visible = true
	dialogue.text = "%s" % GlobalData.computer_input

func _on_Player_died() -> void:
	death_screen.visible = true
