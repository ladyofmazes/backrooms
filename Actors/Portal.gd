extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print('Portal')
	if GlobalData.terror > GlobalData.terror_threshold:
		visible = true
		print('Win!')
		GlobalData.wins += 1.0
