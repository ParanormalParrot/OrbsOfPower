extends HSlider

class_name VolumeSlider

@export var bus_index = "Master"
var save_path = "res://Config/volume.cfg"
var config = ConfigFile.new()
var load_response = config.load(save_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	if config.get_value("Values", bus_index):
		value = config.get_value("Values", bus_index)
	else:
		value = 1
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_index), linear_to_db(value))


func _process(delta):
	pass


func _on_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_index), linear_to_db(value))
	config.set_value("Values", bus_index, value)
	config.save(save_path)
	print(value)
