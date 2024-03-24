extends Homunculus

class_name EarthGolem

@export var earthquakePrefab: PackedScene
@export var earthquake_damage = 10
func attack():
	$AnimationTree["parameters/playback"].travel("attack")
	opponent.take_damage(attackDamage, Enums.DamageType.PHYSICAL)
	var earthquake = earthquakePrefab.instantiate()
	get_parent().add_child(earthquake)
	earthquake.damage = earthquake_damage
	earthquake.global_position = opponent.global_position
	
