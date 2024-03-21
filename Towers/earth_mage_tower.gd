extends AttackTower

class_name EarthMageTower


func attack():
	if enemies != []:
		if animation_tree:
			animation_tree["parameters/playback"].travel("attack")
		var projectiile = projectileAsset.instantiate()
		get_node("ProjectileContainer").add_child(projectiile)
		projectiile.damage = projectileDamage
		var sortedEnemies = enemies
		sortedEnemies.sort_custom(compare_objects)
		var targetEnemy = sortedEnemies[(sortedEnemies.size()-1)/2]
		projectiile.global_position = targetEnemy.global_position
		isAttackCharged = false	
		var angle = rad_to_deg((targetEnemy.global_position - global_position).angle())
		if animation_tree:
			if angle >= 0 && angle <= 180:
				animation_tree["parameters/playback"].travel("attack")
			else:
				animation_tree["parameters/playback"].travel("attack_behind")
			
			


func compare_objects(obj1, obj2):
	return obj1.get_parent().get_progress() - obj2.get_parent().get_progress()
