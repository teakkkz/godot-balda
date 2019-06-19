extends Node2D


onready var hp = get_node("/root/globals")

func _on_menu_pressed():
	hp.health = 5
	hp.curkey = -1
	get_tree().change_scene("res://scenes/Scene1.tscn")
	
	

func _on_Exit_pressed():
	get_tree().quit()
