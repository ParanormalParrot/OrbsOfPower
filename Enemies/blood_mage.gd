extends Enemy

class_name BloodMage

@export var healing_recharge_time = 0
@export var current_healing_recharge_time = 0
@export var healing_amount = 20
@export var healing_duration = 1
var current_healing_duration = 0
var allies: Array[Enemy] = []

func _process(delta):
	current_healing_recharge_time-=delta
	if !is_hypnotized and !isStalled and current_healing_recharge_time <= 0 and allies.size() > 0:	
		var ally = allies[0]
		for i in allies:
			if (float(i.currentHealth)/i.maxHealth) > (float(ally.currentHealth)/ally.maxHealth):
				ally = i
		if ally.currentHealth < ally.maxHealth:
			ally.restore_health(healing_amount)
			current_healing_recharge_time = healing_recharge_time
			current_healing_duration = healing_duration
			$AnimationTree["parameters/playback"].travel("heal")
	else:
		current_healing_recharge_time -= delta
	if current_healing_duration >= 0:
		current_healing_duration-=delta
		return
	super._process(delta)
		
	

func attack():
	super.attack()
	restore_health(attack_damage)


func _on_healing_range_body_entered(body):
	if body.is_in_group("Enemy") and body != self:
		allies.append(body)


func _on_healing_range_body_exited(body):
	if body.is_in_group("Enemy") and body != self:
		allies.erase(body)
