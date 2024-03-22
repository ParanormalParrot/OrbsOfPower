extends Button


class_name StartWaveButton 

@export var waveController: Node2D = null
@export var timer: Node = null


func _on_pressed():
	if waveController!= null:
		GlobalAudioManager.preparation_music.stop()
		GlobalAudioManager.battle_music.play()
		waveController.set_process(true)
		timer.visible = true
		visible = false
		
		
		
