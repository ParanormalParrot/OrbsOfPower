extends Homunculus

@export var earthquakePrefab: PackedScene
@export var earthquake_damage = 10
func attack():
	opponent.take_damage(attackDamage)
	var earthquake = earthquakePrefab.instantiate()
	get_parent().add_child(earthquake)
	earthquake.damage = earthquake_damage
	earthquake.global_position = opponent.global_position
	
