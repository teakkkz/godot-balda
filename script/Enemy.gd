extends "res://script/Control.gd"

var move_timer= 0
var move_timer_length = 2
func _init():
	SPEED = 300
	DAMAGE = 1
	TYPE = "Enemy"
	health = 5

#var TYPE = "Enemy"


func _ready():
	$anime.play("move")


func _physics_process(delta):
	
	damage_hit1()
	if move_timer > 0:
		move_timer -= 1
	if move_timer == 0:
		random_move()
		move_timer = move_timer_length

	
func random_move():
	var v = Vector2(0,0)
	var d = randi() %20+1
	match d:
		1:
			v.x = 500
		2:
			v.x = -500
		3:
			v.y = 500
		4:
			v.y = -500
	move_and_slide(v, Vector2(0, 1))
func damage_hit1():
	if hitstun > 0:
		hitstun -= 1
		$Sprite.texture = texture_hurt
	else:
		$Sprite.texture = texture_default
		if TYPE == "Enemy" && health <= 0:
			var drop = randi() %3
			if drop == 0:
				instance_scene(preload("res://scenes/heartt.tscn"))
			instance_scene(preload("res://scenes/death.tscn"))
			queue_free()
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hitstun == 0 && body.get("DAMAGE") != null && body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hitstun += 5
			print("OIII")
func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)
	
