extends KinematicBody2D
var hitstun = 0
var health = 3
var DAMAGE = null
var TYPE = null
var SPEED = 200
var spritedir = "down"
onready var hp = get_node("/root/globals")
var movedir = Vector2(0,0)

var texture_hurt = null
var texture_default = null

func _ready():
	texture_default = $Sprite.texture
	texture_hurt = load($Sprite.texture.get_path().replace(".png","_hurt.png"))
	
func damage_hit():
	if hitstun > 0:
		hitstun -= 1
		$Sprite.texture = texture_hurt
	else:
		$Sprite.texture = texture_default
		if TYPE == "Enemy" && health <= 0:
			var death_anima = preload("res://scenes/death.tscn").instance()
			get_parent().add_child(death_anima)
			death_anima.global_transform = global_transform
			queue_free()
		elif TYPE == "Player" && hp.health <= 0:
#			var death_anima = preload("res://player_death.tscn").instance()
#			get_parent().add_child(death_anima)
#			death_anima.global_transform = global_transform
			queue_free()
			get_tree().change_scene("res://scenes/GameOver.tscn")

	for area in $hitbox.get_overlapping_areas():
		var body = area.get_parent()
		if hitstun == 0 && body.get("DAMAGE") != null && body.get("TYPE") != TYPE:
			hp.health -= body.get("DAMAGE")
			hitstun = 35
			print("OIII")
	



func move_player(delta):
	var v = Vector2(0,0)
	if Input.is_key_pressed(KEY_LEFT):
		v.x = -SPEED
		$anime.play("walkleft")
		spritedir = "left"
	elif Input.is_key_pressed(KEY_RIGHT):
		v.x = SPEED
		$anime.play("walkright")
		spritedir = "right"
	elif Input.is_key_pressed(KEY_UP):
		v.y = -SPEED
		$anime.play("walkup")
		spritedir = "up"
	elif Input.is_key_pressed(KEY_DOWN):
		v.y = SPEED
		$anime.play("walkdown")
		spritedir = "down"
	else:
		v.x = 0
		v.y = 0
		$anime.stop() 

	move_and_slide(v, Vector2(0, 0))

	
func use_item(item):
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(),self))
	add_child(newitem)
	if get_tree().get_nodes_in_group(str(newitem.get_name(),self)).size() > newitem.maxamount :
		newitem.queue_free()

func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)
	
