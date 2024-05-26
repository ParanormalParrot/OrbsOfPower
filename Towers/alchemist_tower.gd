extends Tower

class_name AlchemistTower
var enemies = []
var homunculi = []
@export var homunculusAsset: PackedScene
@export var number_of_summons = 2
@export var spawnRate = 5
var currentSpawnTime = spawnRate

	
func _process(delta):
	currentSpawnTime-=delta
	if currentSpawnTime <= 0:
		for i in homunculi:
			if i == null:
				homunculi.erase(i)
		if homunculi.size() < number_of_summons:
			var homunculus = homunculusAsset.instantiate()
			homunculi.append(homunculus)
			get_tree().get_current_scene().add_child(homunculus)
			var position = Vector2($Flag.global_position.x + randi()%50 -25 , $Flag.global_position.y)
			homunculus.global_position = position
			homunculus.default_position = position
			homunculus.enemies = enemies
			currentSpawnTime = spawnRate
			
func _on_aggro_range_body_entered(body):
	if body.is_in_group("Enemy") and !(body in enemies):
		enemies.append(body)
	
func _on_aggro_range_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)
		
func _on_range_body_entered(body):
	if body == $Flag:
		$Flag.is_in_range = true

func _on_range_body_exited(body):
	if body == $Flag:
		$Flag.is_in_range = false
		
func _exit_tree():
	for i in homunculi:
		if is_instance_valid(i):
			i.queue_free()
			
func reposition_homunculi():
	for i in homunculi:
		var new_position = Vector2($Flag.global_position.x + randi()%30 -15 , $Flag.global_position.y)
		i.global_position = new_position
		i.default_position = new_position
