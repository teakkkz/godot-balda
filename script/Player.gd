extends "res://script/Control.gd"



func _init():
	SPEED = 300
	TYPE = "Player"
#func _ready():

func _physics_process(delta):
	move_player(delta)
#	use_item(item)

	damage_hit()


	if Input.is_action_just_pressed("a"):
		use_item(preload("res://scenes/sword.tscn"))
		
func _on_Area2D_body_entered(body): # This is called when Area2D detects a collision
    queue_free()