extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$area.connect("body_entered",self,"unlock")
	
func unlock(body):
	if body.name == "Player":
		queue_free()
		get_tree().change_scene("res://scenes/Scene5.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
