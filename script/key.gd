extends Area2D
onready var hp = get_node("/root/globals")
func _ready():
	connect("body_entered",self,"body_entered")

	
func body_entered(body):
	if body.name == "Player":
		hp.curkey += 1
		queue_free()