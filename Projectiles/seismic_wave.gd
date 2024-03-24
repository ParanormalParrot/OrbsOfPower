extends PsychicWave

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage, Enums.DamageType.PSYCHIC)
		body.stun(0.5)
		body.slow_down(slow_duration, slow_effect)
