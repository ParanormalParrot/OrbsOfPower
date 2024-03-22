extends CharacterBody2D

class_name PsychicWave

var damage 
var target
var targetPosition 
@export var speed = 150
@export var lifetime = 1.0
var current_lifetime = lifetime
@export var slow_effect = 0.2
@export var slow_duration = 2.0



func _process(delta):
	if current_lifetime <= 0:
		queue_free()
	current_lifetime-=delta
	if current_lifetime <= lifetime/2:
		modulate.a -= 0.01
	
func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(rotation)
	move_and_slide()
	
	
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage, Enums.DamageType.PSYCHIC)
		body.slow_down(slow_duration, slow_effect)
		
func set_target(target):
	targetPosition = target.global_position
	look_at(targetPosition)
	
		
		
