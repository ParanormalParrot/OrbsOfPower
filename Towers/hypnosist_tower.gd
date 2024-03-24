extends AttackTower

class_name HypnosistTower

@export var hypnosis_time= 5

var controlled_enemy

func attack():
	if enemies != []:
		target = enemies[0];
		for i in enemies:
			if i.get_parent().get_progress() > target.get_parent().get_progress():
				target = i;
		target.hypnosisTime = hypnosis_time
		target.take_damage(projectileDamage, Enums.DamageType.PSYCHIC)
		controlled_enemy = target


		

