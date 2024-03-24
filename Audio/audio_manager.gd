extends Node

class_name AudioManager

@onready var menu_music = $MenuMusic
@onready var preparation_music = $PreparationMusic
@onready var battle_music = $BattleMusic

func mute_all():
	for i in get_children():
		i.stop()
