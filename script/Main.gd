extends Node2D


onready var hp = get_node("/root/globals")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://sound/BNK48.wav")
	player.play()# Replace with function body.
func _process(delta):
	if hp.curkey == 1:
		$door.show()
	else:
		$door.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
