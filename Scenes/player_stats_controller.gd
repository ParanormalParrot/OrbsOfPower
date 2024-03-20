extends Node2D

class_name PlayerStatsController

@export var defeat_menu: Node
@export var manaLabel: Label 
@export var heartsLabel: Label
@export var mana: int:
	get:
		return mana
	set(value):
		mana = value
		if manaLabel:
			manaLabel.text = (str(mana))
@export var hearts: int:
	get:
		return hearts
	set(value):
		hearts = value
		if heartsLabel:
			heartsLabel.text = (str(hearts))
		if hearts == 0:
			defeat_menu.visible = true
			get_tree().paused = true
@export var numberOfWaves = 1
var currentWaveNumber: int = 0:
	get:
		return mana
	set(value):
		mana = value
		if manaLabel:
			manaLabel.text = (str(mana))
		
	
# Called when the node enters the scene tree for the first time.
func _ready():
	mana = mana 
	hearts = hearts
	

