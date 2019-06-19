extends KinematicBody2D
var texture_hurt = null
var texture_default = null
var move_timer= 0
var move_timer_length = 10
var hitstun = 0
var SPEED = 300
var DAMAGE = 1
var TYPE = "Enemy"
var health = 20
var d = move_timer
var movedir = Vector2(0,0)
func _ready():
	fireball()
	fireball2()
	$anime.play("default")
	
	texture_default = $Sprite.texture
	texture_hurt = load($Sprite.texture.get_path().replace("boss1.png","boss_hurt.png"))

func _physics_process(delta):
#	random_move(delta)
	damage_hit1()
	
#	fireball()
#	boss_move()
		
#	random_move()
	if move_timer > 0:
		move_timer -= 1
	if move_timer == 0:
		boss_move()
		move_timer = move_timer_length
		

func boss_move():
	var d = randi() % 4+1
	match d:
		1:
			movedir.x = 500
		2:
			movedir.x = -500
		3:
			movedir.y = 500
		4:
			movedir.y = -500
	move_and_slide(movedir,Vector2(0,0))
	print(movedir)
func damage_hit1():
	if hitstun > 0:
		hitstun -= 1
		$Sprite.texture = texture_hurt
	else:
		$Sprite.texture = texture_default
		if TYPE == "Enemy" && health <= 0:
			var death_anima = preload("res://scenes/death.tscn").instance()
			get_parent().add_child(death_anima)
			death_anima.global_transform = global_transform
			instance_scene(preload("res://scenes/Princess.tscn"))
			queue_free()
	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hitstun == 0 && body.get("DAMAGE") != null && body.get("TYPE") != TYPE:
			health -= body.get("DAMAGE")
			hitstun = 10
			print("OIII")
	
			
func fireball():
	var fire = preload("res://scenes/dot.tscn").instance()
	self.add_child(fire)

func fireball2():
	var fire1 = preload("res://scenes/dot1.tscn").instance()
	self.add_child(fire1)

func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)
	