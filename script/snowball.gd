extends Node2D
const Snow = preload("res://scenes/snow1.tscn")
const SNOW_SPEED = 200
const SNOW_DROP_TIME = 0.7
var snows = []
var snow_time = 0
onready var hp = get_node("/root/globals")
	
func _ready():
	randomize()
	
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://sound/BNK48.wav")
	player.play()


	
func _process(delta):
	create_snow(delta)
	drop_snow(delta)
	if hp.curkey == 2:
		$door.show()
	else:
		$door.hide()
#	check_collision(delta)
	
func create_snow(delta):
	snow_time += delta
	if snow_time > SNOW_DROP_TIME:
		snow_time = 0
		var snow = Snow.instance()
		self.add_child(snow)
		snows.append(snow)
		snow.position.x = 10
		snow.position.y = randf() * 500
		
func drop_snow(delta):
	for snow in snows:
		snow.position.x += SNOW_SPEED * delta

func _on_playera_area_entered(area):
	if area.is_in_group("Snow"):
		var i = snows.find(area)
		snows.remove(i)
		area.queue_free()
