extends Enemy

class_name BloodMage

@export var healing_recharge_time = 0
@export var current_healing_recharge_time = 0
@export var healing_amount = 20
@export var healing_duration = 1
var current_healing_duration = healing_duration
var allies: Array[Enemy] = []

func _process(delta):
	if !is_hypnotized and current_healing_recharge_time <= 0:	
		var ally = allies[0]
		for i in allies:
			if (float(i.currentHealth)/i.maxHealth) > (float(ally.currentHealth)/ally.maxHealth):
				ally = i
		if ally.currentHealth < ally.maxHealth:
			ally.restore_health(healing_amount)
			current_healing_duration = healing_duration
		current_healing_recharge_time = healing_recharge_time
	else:
		current_healing_recharge_time -= delta
	if healing_duration >= 0:
		$AnimationPlayer.play("heal")
		pass
	super._process(delta)
		
	

func attack():
	super.attack()
	restore_health(attack_damage)

func _on_speed_boost_area_body_entered(body):
	if body.is_in_group("Enemy") and body != self:
		allies.append(body)



func _on_speed_boost_area_body_exited(body):
	if body.is_in_group("Enemy") and body != self:
		allies.erase(body)
