extends CharacterBody2D

@export var move_score: = 1.0
@export var move_insanity = 500
@export var speed: int = 80.0
@export var start_position = Vector2.ZERO

func _ready() -> void:
		GlobalData.connect("died", Callable(self, "die"))

func _physics_process(delta):
	var insanity_distance = GlobalData.insanity_distance
	var velocity = Vector2.ZERO
	if start_position == Vector2.ZERO:
		var start_position = position
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1.0
		if abs((position - start_position).length()) > insanity_distance:
			insanity()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1.0
		if abs((position - start_position).length()) > insanity_distance:
			insanity()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
		if abs((position - start_position).length()) > insanity_distance:
			insanity()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
		if abs((position - start_position).length()) > insanity_distance:
			insanity()
		
	set_velocity(velocity * speed)
	move_and_slide()
	if(GlobalData.score>500):
		visible = true
	
func insanity() -> void:
		if(GlobalData.score<=move_insanity):
			GlobalData.score += move_score
			
func die() -> void:
		print('Dead')
