extends Area2D


onready var hp = get_node("/root/globals")
onready var hp1 = get_parent().get_node("hud/heart1")
onready var hp2 = get_parent().get_node("hud/heart2")
onready var hp3 = get_parent().get_node("hud/heart3")
onready var hp4 = get_parent().get_node("hud/heart4")
onready var hp5 = get_parent().get_node("hud/heart5")
func _ready():
	connect("body_entered",self,"body_entered")

func body_entered(body):
	if body.name == "Player" && hp.health < 5:
		if hp.health == 4:
			hp.health += 1
			hp5.show()
		elif hp.health == 3:
			hp.health += 1
			hp4.show()
		elif hp.health == 2:
			hp.health += 1
			hp3.show()
		elif hp.health == 1:
			hp.health += 1
			hp2.show()
		elif hp.health == 0:
			hp.health += 1
			hp1.show()
		queue_free()
		print(hp.health)
