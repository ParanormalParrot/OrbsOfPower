extends AttackTower

func attack():
	if enemies != []:
		var projectiile = projectileAsset.instantiate()
		get_node("ProjectileContainer").add_child(projectiile)
		projectiile.damage = projectileDamage
		var sortedEnemies = enemies
		sortedEnemies.sort_custom(compare_objects)
		var targetEnemy = sortedEnemies[(sortedEnemies.size()-1)/2]
		projectiile.global_position = targetEnemy.global_position
		isAttackCharged = false	


func compare_objects(obj1, obj2):
	return obj1.get_parent().get_progress() - obj2.get_parent().get_progress()
