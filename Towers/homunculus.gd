extends CharacterBody2D
class_name Homunculus
var isFighting = false
var opponent = null
@export var attackDamage = 4
var defaultPosition = Vector2.ZERO
@export var attackRechargeTime = 1
@export var max_health = 50
var current_health = max_health
var currentAttackRechargeTime 
var speed = 50
var enemies = []

# Called when the node enters the scene tree for the first time.


func _ready():
	currentAttackRechargeTime = attackRechargeTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemies.size() == 0:
		var direction = global_position.direction_to(defaultPosition)
		var distance = global_position.distance_to(defaultPosition)

		var max_speed = (distance / delta)
		velocity = direction * minf(speed, max_speed)
		move_and_slide()
	else:
		if !isFighting:
			if opponent == null:
				opponent = enemies[enemies.size() - 1]
				for i in enemies:
					if i.get_parent().get_progress() > opponent.get_parent().get_progress():
						opponent = i;
				opponent.opponent = self
				opponent.isStalled = true
			else:
				var destination = Vector2(opponent.global_position.x + 20, opponent.global_position.y)
				var direction = global_position.direction_to(destination)
				var distance = global_position.distance_to(destination)

				var max_speed = (distance / delta)
				velocity = direction * minf(speed, max_speed)
				move_and_slide()
				if global_position == destination:
					isFighting = true
				
		else:
			if opponent == null:
				isFighting = false
			else:
				if currentAttackRechargeTime <= 0:
					attack()
					currentAttackRechargeTime = attackRechargeTime
				currentAttackRechargeTime-=delta
				
func take_damage(damage):
	current_health-=damage
	if current_health <= 0:
		queue_free()
	
	
func attack():
	opponent.take_damage(attackDamage)
	
	

