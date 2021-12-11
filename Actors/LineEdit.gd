extends LineEdit

export var click_score: = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	set_cursor_position(len(text))

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if(GlobalData.score>0):
			sanity()
			visible = false
		else:
			visible = true
			grab_focus()
			set_cursor_position(len(text))

func sanity() -> void:
		GlobalData.score -= click_score
