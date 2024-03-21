extends Enemy

class_name StandardBearer

var allies: Array[Enemy] = []
@export var buff_rate = 1
var current_buff_rate = 0
@export var buff_time = 1.5
@export var speed_buff = 0.3

func _process(delta):
	super._process(delta)
	current_buff_rate-=delta
	if current_buff_rate <= 0:
		current_buff_rate = buff_rate
		for i in allies:
			i.speed_up(buff_time, speed_buff)
	
	

func _on_speed_boost_area_body_entered(body):
	if body.is_in_group("Enemy") and body != self:
		allies.append(body)



func _on_speed_boost_area_body_exited(body):
	if body.is_in_group("Enemy") and body != self:
		allies.erase(body)
