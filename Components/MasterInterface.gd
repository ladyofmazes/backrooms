extends Control

onready var score_label: Label = $Score
onready var death_screen: ColorRect = $DeathScreen
onready var death_label: Label = $DeathScreen/DeathLabel
onready var dialogue_box: ColorRect = $DialogueBox
onready var dialogue: Label = $DialogueBox/Dialogue
var current_json: Dictionary = {}

func _ready() -> void:
		GlobalData.connect("updated", self, "update_interface")
		GlobalData.connect("text_input", self, "show_computer_dialogue")
		GlobalData.connect("json_data", self, "load_json")
		GlobalData.connect("died", self, "_on_Player_died")
		update_interface()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		death_screen.visible = false
		dialogue_box.visible = false

func update_interface() -> void:
	score_label.text = "Score: %s" % GlobalData.score

func load_json() -> void:
		var json_path = GlobalData.json_path
		var data = {}
		var jsonFile = File.new()
		jsonFile.open(json_path, jsonFile.READ)

		if(jsonFile.get_error()):
				print("Error while reading: ", json_path)

		var text = jsonFile.get_as_text()
		var text_json = JSON.parse(text)
		data = text_json.result
		jsonFile.close()
		current_json = data
		
func show_computer_dialogue() -> void:
	dialogue_box.visible = true
	if GlobalData.computer_input in current_json:
		if current_json[GlobalData.computer_input] != "":
			dialogue.text = "%s" % current_json[GlobalData.computer_input]
		else:
			GlobalData.command_list.append(GlobalData.computer_input)
	else:
		dialogue.text = "Invalid command"

func _on_Player_died() -> void:
	death_screen.visible = true
