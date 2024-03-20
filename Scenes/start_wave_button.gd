extends Button


@export var waveController: Node2D = null
@export var timer: Node = null


func _on_pressed():
	if waveController!= null:
		waveController.set_process(true)
		timer.visible = true
		visible = false
		
		
