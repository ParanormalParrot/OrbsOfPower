extends Node2D

@onready var path = preload("res://level1_path.tscn")
@onready var footman = preload("res://Enemies/footman.tscn")

const EnemySequence = preload("res://Resources/enemy_sequence.gd")
const Wave = preload("res://Resources/wave.gd")
@export var enemies: Dictionary
@export var waves: Array[Wave] = []
@export var time_label: Label
@export var wave_label: Label
@export var paths: Array[PackedScene]
@export var victory_menu: Node

var current_wave: Wave
var current_wave_index = 0 

var wave_time = 0.0
	
func _ready():
	current_wave = waves[0]
	wave_label.text = "wave " + str(current_wave_index)+ "/" + str(waves.size())
	set_process(false)
func _process(delta):
	wave_label.text = "wave " + str(current_wave_index + 1)+ "/" + str(waves.size())
	for i in current_wave.enemy_sequences:
		wave_label.text = "wave " + str(current_wave_index + 1)+ "/" + str(waves.size())
		if wave_time >= i.start - i.step and  wave_time <= i.start + i.count* i.step:
			i.current_time+=delta
		if i.current_time >= i.step:
			if i.enemy != null:
				var tempPath = paths[i.path_index].instantiate()
				add_child(tempPath)
				tempPath.position = Vector2(tempPath.position.x, tempPath.position.y - 8 + randi()%16)
				var enemy = i.enemy.instantiate()
				tempPath.get_child(0).add_child(enemy)
				i.current_time = 0
				
	wave_time+=delta
	if current_wave.duration - wave_time >= 0:
		time_label.text = "Time: " + str((int)(current_wave.duration - wave_time))
	if wave_time >= current_wave.duration and current_wave_index < waves.size() - 1:
		current_wave_index+=1
		current_wave = waves[current_wave_index]
		wave_time = 0
	if current_wave_index ==  waves.size() - 1 and current_wave.duration - wave_time <= 0:
		if get_child_count() == 0:
			victory_menu.visible = true
		
		
				
				
			




	
	
