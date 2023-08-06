extends Node

var _energy = ReactiveProperty.new(0)
var energy = _energy.to_readonly()


func increase_energy(amount):
	_energy.Value += amount


func decrease_energy(amount):
	_energy.Value -= amount


# Spawner
var required_job_points = ReactiveProperty.new(5.0)
var spawner_level = ReactiveProperty.new(1)


func level_up_spawner() -> void:
	spawner_level.Value += 1


# Chara
var aoi_level = ReactiveProperty.new(1)


func level_up_aoi() -> void:
	aoi_level.Value += 1


# Player
var player_level = ReactiveProperty.new(1)


func level_up():
	player_level.Value += 1


func get_required_energy(level: int) -> int:
	return level * 10


func get_job_per_click(level: int) -> int:
	return level


# Buildings
var building_tier1_level = ReactiveProperty.new(1)


func buy_building_tier1():
	building_tier1_level.Value += 1


# Onigiri
func get_onigiri_energy(level: int) -> int:
	return level


## Other
func _exit_tree() -> void:
	_energy.dispose()
	energy.dispose()
	required_job_points.dispose()
