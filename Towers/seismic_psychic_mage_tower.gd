extends AttackTower


func attack():
	var projectile1 = projectileAsset.instantiate()
	var projectile2 = projectileAsset.instantiate()
	var projectile3 = projectileAsset.instantiate()
	var projectile4 = projectileAsset.instantiate()
	var projectile5 = projectileAsset.instantiate()
	var projectile6 = projectileAsset.instantiate()
	var projectile7 = projectileAsset.instantiate()
	var projectile8 = projectileAsset.instantiate()
	get_node("ProjectileContainer").add_child(projectile1)
	get_node("ProjectileContainer").add_child(projectile2)
	get_node("ProjectileContainer").add_child(projectile3)
	get_node("ProjectileContainer").add_child(projectile4)
	get_node("ProjectileContainer").add_child(projectile5)
	get_node("ProjectileContainer").add_child(projectile6)
	get_node("ProjectileContainer").add_child(projectile7)
	get_node("ProjectileContainer").add_child(projectile8)
	projectile1.global_position = $ShotPoint.global_position 
	projectile2.global_position = $ShotPoint.global_position
	projectile3.global_position = $ShotPoint.global_position
	projectile4.global_position = $ShotPoint.global_position
	projectile5.global_position = $ShotPoint.global_position
	projectile6.global_position = $ShotPoint.global_position
	projectile7.global_position = $ShotPoint.global_position
	projectile8.global_position = $ShotPoint.global_position
	projectile1.rotation_degrees = 0
	projectile2.rotation_degrees = 45
	projectile3.rotation_degrees = 90
	projectile4.rotation_degrees = 135
	projectile5.rotation_degrees = 180
	projectile6.rotation_degrees = 225
	projectile7.rotation_degrees = 270
	projectile8.rotation_degrees = 315
	
	projectile1.damage = projectileDamage
	projectile2.damage = projectileDamage
	projectile3.damage = projectileDamage
	projectile4.damage = projectileDamage
	projectile5.damage = projectileDamage
	projectile6.damage = projectileDamage
	projectile7.damage = projectileDamage
	projectile8.damage = projectileDamage
	
