extends StaticBody2D
var enemies = []
var homunculi = []
@export var homunculusAsset: PackedScene
@export var number_of_summons = 2
var spawnRate = 5
var currentSpawnTime = spawnRate
var cost


func _process(delta):
	
	currentSpawnTime-=delta
	if currentSpawnTime <= 0:
		if homunculi.size() < number_of_summons:
			var homunculus = homunculusAsset.instantiate()
			homunculi.append(homunculus)
			add_child(homunculus)
			
			homunculus.global_position = $Flag.global_position
			homunculus.enemies = enemies
			homunculus.defaultPosition = $Flag.global_position
			currentSpawnTime = spawnRate

			
	
		
		
		

func _on_aggro_range_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body)
		for i in homunculi:
			i.enemies.append(body)



func _on_aggro_range_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)
		for i in homunculi:
			i.enemies.erase(body)



func _on_range_body_entered(body):
	if body == $Flag:
		$Flag.is_in_range = true




func _on_range_body_exited(body):
	if body == $Flag:
		$Flag.is_in_range = false
