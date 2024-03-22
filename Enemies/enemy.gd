extends CharacterBody2D

class_name Enemy

@export var speed = 50
@export var maxHealth = 20

@export var attack_damage = 10
@export var attack_recharge_time = 2
var current_attack_recharge_time = attack_recharge_time

var currentHealth = maxHealth
var stunTime = 0
var slownessTime = 0
var speed_buff_time = 0
var speed_effect = 0
var slow_effect = 0
var isStalled = false
var isFighting = false
var opponent
var tower_target
var is_hypnotized
var hypnosisTime = 0
var opponents = []
@export var heartCost = 1
@export var manaReward = 1
@export var PhysicalDefense = 0.0 
@export var FireDefense = 0.0 
@export var PsychicDefense = 0.0 

func _ready():
	tower_target = $Target
	$HypnosisIndicator.visible = false
	$StalledIndicator.visible = false
	currentHealth = maxHealth

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  stunTime > 0:
		stunTime-=delta
	elif isStalled:
		$StalledIndicator.visible = true
		if opponent == null:
			isStalled = false
			isFighting = false
			if $AnimationPlayer:
				$AnimationPlayer.play("walk")
			$StalledIndicator.visible = false	
		if isFighting:
			if $AnimationPlayer:
				$AnimationPlayer.play("attack")
			if current_attack_recharge_time <= 0:
				attack()
				current_attack_recharge_time = attack_recharge_time
			current_attack_recharge_time-=delta
	elif hypnosisTime > 0:
		if !is_hypnotized:
			isStalled = false
			opponent = null
			is_hypnotized = true
			$HypnosisIndicator.visible = true
			scale.x*=-1
		else:
			if !isFighting:
				if opponent == null:
					var valid_opponents = []
					for i in opponents:
						if i!= null && !i.is_hypnotized:
							valid_opponents.append(i)
						
					if valid_opponents.size() > 0:
						opponent = valid_opponents[valid_opponents.size() - 1]
						for i in valid_opponents:
							if i != null:
								if i.get_parent().get_progress() > opponent.get_parent().get_progress():
									opponent = i;
						opponent.opponent = self
						opponent.isStalled = true
					else:
						var parent = get_parent()
						if $AnimationPlayer:
							$AnimationPlayer.play("walk")
						parent.set_progress(parent.get_progress() - (1 - slow_effect) * (1+speed_effect) * speed * delta)
						
				else:
					var destination = Vector2(opponent.global_position.x + 20, opponent.global_position.y)
					var direction = global_position.direction_to(destination)
					var distance = global_position.distance_to(destination)

					var max_speed = (distance / delta)
					velocity = direction * minf(speed, max_speed)
					move_and_slide()
					if global_position == destination:
						isFighting = true
						opponent.isFighting = true
				
				
			else:
				if opponent == null:
					if $AnimationPlayer:
							$AnimationPlayer.play("walk")
					isFighting = false
				else:
					if $AnimationPlayer:
							$AnimationPlayer.play("attack")
					if current_attack_recharge_time <= 0:
						attack()
						current_attack_recharge_time = attack_recharge_time
					current_attack_recharge_time-=delta
			hypnosisTime-=delta
				
	
		
	else:
		if is_hypnotized:
			if opponent != null:
				opponent.isStalled = false
				opponent = null
			scale.x*=-1
			$HypnosisIndicator.visible = false
			is_hypnotized = false
		if opponent != null:
			opponent.isStalled = false
		if slownessTime > 0:
			slownessTime -= delta
		else:
			slow_effect = 0
		if speed_buff_time > 0:
			speed_buff_time-=delta
		else:
			speed_effect = 0
			
		var parent = get_parent()
		parent.set_progress(parent.get_progress() + (1 - slow_effect) * (1+speed_effect) * speed * delta)
		
	
func take_damage(damage, damageType = Enums.DamageType.PURE):
	if damageType == Enums.DamageType.PURE:
		currentHealth -= damage
	elif damageType == Enums.DamageType.PHYSICAL:
		currentHealth -= (int)((1-PhysicalDefense)*damage)
	elif damageType == Enums.DamageType.FIRE:
		currentHealth -= (int)((1-FireDefense)*damage)
	elif damageType == Enums.DamageType.PSYCHIC:
		currentHealth -= (int)((1-PsychicDefense)*damage)
	if currentHealth <= 0:
		death()
		
func stun(time):
	stunTime = time
	
func slow_down(time, mult):
	slownessTime = time 
	if mult > slow_effect:
		slow_effect = mult
		
func speed_up(time, mult):
	speed_buff_time = time 
	if mult > speed_effect:
		speed_effect = mult
	
func death():
	get_tree().get_root().get_node("Main/PlayerStatsController").mana+= manaReward
	get_parent().get_parent().queue_free()


func attack():
	opponent.take_damage(attack_damage)
	

func restore_health(restored_amount):
	if currentHealth + restored_amount >= maxHealth:
		currentHealth = maxHealth
	else:
		currentHealth += restored_amount
		
	

func _on_sight_body_entered(body):
	if body.is_in_group("Enemy") && body!= self:
		opponents.append(body)





func _on_sight_body_exited(body):
	if body.is_in_group("Enemy"):
		opponents.erase(body)
