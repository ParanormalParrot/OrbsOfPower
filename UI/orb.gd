extends TextureRect

class_name Orb

@export var gameController: Node2D
@export var mana_cost = 100

func _ready():
	$ManaCostLabel.text = str(mana_cost)

func _process(delta):
	if gameController.mana >= mana_cost:
		$ManaCostLabel.set("theme_override_colors/font_color",Color.WHITE)
	else:
		$ManaCostLabel.set("theme_override_colors/font_color",Color.RED)
