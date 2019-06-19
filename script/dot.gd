extends Area2D
var TYPE = "Enemy"
var DAMAGE = 1
var hitstun = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _process(delta):
	$anime.play("default")

	
#func _process(delta):
#	self.position.x += 1  
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
