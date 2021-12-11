extends KinematicBody2D

export var move_score: = 1.0
export var move_insanity = 500
export(int) var speed = 80.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1.0
		insanity()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1.0
		insanity()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
		insanity()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
		insanity()
		
	move_and_slide(velocity * speed)
	
func insanity() -> void:
		if(GlobalData.score<move_insanity):
			GlobalData.score += move_score
