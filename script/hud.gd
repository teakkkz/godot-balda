extends CanvasLayer
#func _process(delta):
var curkey
var heart
onready var hp = get_node("/root/globals")
func _process(delta):
	if hp.curkey != 0:
		$keys.show()
	else:
		$keys.hide()
		
	
	if hp.health == 4:
		$heart5.hide()
	elif hp.health == 3:
		$heart5.hide()
		$heart4.hide()
	elif hp.health == 2:
		$heart5.hide()
		$heart4.hide()
		$heart3.hide()
	elif hp.health == 1:
		$heart5.hide()
		$heart4.hide()
		$heart3.hide()
		$heart2.hide()
	elif hp.health == 0:
		$heart5.hide()
		$heart4.hide()
		$heart3.hide()
		$heart2.hide()
		$heart1.hide()
