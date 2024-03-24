extends StaticBody2D

class_name AttackTower

@export var projectileAsset = preload("res://Projectiles/spark.tscn")
@export var projectileDamage = 5
@export var recharge_time = 1.0
var cost = 0

var current_recharge_time = recharge_time
var enemies = []

var target
var isAttackCharged = false

@export var animation_tree = AnimationTree

func _ready():
	$TowerUI.visible = false

func _on_range_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body)
		


func _on_range_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)


func _process(delta):
	current_recharge_time -= delta
	if current_recharge_time <= 0:
		if enemies != []:
			attack()
			current_recharge_time = recharge_time
		

		
func attack():
	if enemies != []:
		var projectiile = projectileAsset.instantiate()
		get_node("ProjectileContainer").add_child(projectiile)
		projectiile.global_position = $ShotPoint.global_position
		projectiile.damage = projectileDamage
		target = enemies[0];
		for i in enemies:
			if i.get_parent().get_progress() > target.get_parent().get_progress():
				target = i;
		projectiile.target = target;
		isAttackCharged = false	
		var angle = rad_to_deg((target.global_position - global_position).angle())
		if angle >= -30 && angle <= 210:
			$AnimationTree["parameters/playback"].travel("idle")
		else:
			$AnimationTree["parameters/playback"].travel("idle_behind")
		

	

func _on_mouse_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_mask == 1:
		$TowerUI.visible = !$TowerUI.visible


func _on_dismantle_button_pressed():
	get_tree().get_root().get_node("Main/PlayerStatsController").mana+= cost/2
	queue_free()
	

func _on_tower_ui_mouse_exited():
	$TowerUI.visible = false
