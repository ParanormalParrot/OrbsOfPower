extends AttackTower



func attack():
	if enemies != []:
		var projectiile = projectileAsset.instantiate()
		get_node("ProjectileContainer").add_child(projectiile)
		projectiile.global_position = $ShotPoint.global_position
		projectiile.damage = projectileDamage
		target = enemies[0];
		for i in enemies:
			if i.get_parent().get_progress() > target.get_parent().get_progress():
				target = i;
		projectiile.set_target(target)
		isAttackCharged = false	

