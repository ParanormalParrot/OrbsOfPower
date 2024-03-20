extends CharacterBody2D

var damage 
var target
var targetPosition 
var speed = 150
@export var lifetime = 1.0
@export var slow_effect = 0.2
@export var slow_duration = 2.0



func _process(delta):
	if lifetime <= 0:
		queue_free()
	lifetime-=delta
	
func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(rotation)
	move_and_slide()
	
	
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage)
		body.slow_down(slow_duration, slow_effect)
		
func set_target(target):
	targetPosition = target.global_position
	look_at(targetPosition)
	
		
		
