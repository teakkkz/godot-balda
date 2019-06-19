extends StaticBody2D

onready var hp = get_node("/root/globals")
func _ready():
	$area.connect("body_entered",self,"unlock")
	
func unlock(body):
	if body.name == "Player" && hp.curkey == 1:
		hp.curkey -= 1
		queue_free()
		get_tree().change_scene("res://scenes/Scene2.tscn")
	elif body.name == "Player" && hp.curkey == 2:
		hp.curkey -= 2
		get_tree().change_scene("res://scenes/Scene4.tscn")
	elif body.name == "Player" && hp.curkey == -1:
		hp.curkey += 1
		get_tree().change_scene("res://scenes/Main.tscn")
		