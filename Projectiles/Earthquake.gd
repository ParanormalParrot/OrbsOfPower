extends Node2D

var damage 
@export var lifetime = 2
@export var attack_time = 0.1


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if lifetime <= 0:
		queue_free()
	lifetime-=delta
	attack_time -= delta
	$Sprite.modulate.a-= 0.001

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		if attack_time > 0:
			body.take_damage(damage)
			body.stun(0.5)
		
		
