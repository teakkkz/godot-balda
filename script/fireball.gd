extends Node2D
var maxamount = 5
var move_timer = 0
var move_timer_length = 15
var TYPE = "Enemy"
var DAMAGE = 1
func _ready():
	connect("body_entered",self,"destroy")
	
func _physics_process(delta):
	if maxamount > 0:
		random_move(delta)
		maxamount -= 1

	elif maxamount == 0:
		maxamount = 5
		
	
func random_move(delta):
	var v = Vector2(0,0)
	if move_timer > 0:
		move_timer -= 1
	if move_timer == 0:
		move_timer = move_timer_length
		
	if move_timer == 100:
		v.x = 2000
	elif move_timer == 70:
		v.x = -2000
	elif move_timer ==40:
		v.y = -2000
	elif move_timer ==10:
		v.x = -2000
	translate(v*delta)
#func attack(delta):
#
#	var v = Vector2(0,0)
#
#		var d = randi() %20+1
#		match d:
#			1 :
#				v.x = 1000
#			5:
#				v.y = 1000 
#			13:
#				v.x = -1000
#			18:
#				v.y = -1000
#
#	translate(v * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func destroy():
	queue_free()