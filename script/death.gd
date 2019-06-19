extends Node2D

func _ready():
	$anime.play("die")
	$anime.connect("animation_finished",self,"destroy")
	
func destroy():
	queue_free()