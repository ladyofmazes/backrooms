extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	GlobalData.terror += 1.0
	GlobalData.deaths += 1.0
