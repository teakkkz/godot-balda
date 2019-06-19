extends Area2D

func _ready():
	connect("body_entered",self,"destroy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func destroy():
	queue_free()