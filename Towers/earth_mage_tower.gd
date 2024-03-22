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
		target = enemies[0];
		for i in enemies:
			if i.get_parent().get_progress() > target.get_parent().get_progress():
				target = i;
		projectiile.global_position = target.global_position
		isAttackCharged = false	
		var angle = rad_to_deg((target.global_position - global_position).angle())
		if animation_tree:
			if angle >= -30 && angle <= 210:
				animation_tree["parameters/playback"].travel("attack")
			else:
				animation_tree["parameters/playback"].travel("attack_behind")
			
			


func compare_objects(obj1, obj2):
	return obj1.get_parent().get_progress() - obj2.get_parent().get_progress()
