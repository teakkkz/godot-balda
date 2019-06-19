extends Node2D
var TYPE = null
var DAMAGE = 1
var maxamount = 1
var hitstun = 0
func _ready():
	TYPE = get_parent().TYPE
	$anime.connect("animation_finished", self,"destroy")
	$anime.play(str("swing",get_parent().spritedir))

func destroy(animation):
	queue_free()
	
