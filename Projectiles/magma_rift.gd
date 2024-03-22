extends Earthquake

@export var fire_damage = 20

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		if attack_time > 0:
			body.take_damage(damage, Enums.DamageType.PHYSICAL)
			body.take_damage(damage, Enums.DamageType.FIRE)
			body.stun(0.5)
