extends Homunculus

class_name FireHomunculus

@export var fire_attack_damage = 10


func attack():
	$AnimationTree["parameters/playback"].travel("attack")
	opponent.take_damage(attackDamage, Enums.DamageType.PHYSICAL)
	opponent.take_damage(fire_attack_damage, Enums.DamageType.FIRE)
