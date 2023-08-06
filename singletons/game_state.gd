extends Node

var _energy = ReactiveProperty.new(0)
var energy = _energy.to_readonly()

# Spawner
var required_job_points = ReactiveProperty.new(5.0)

# Player
var player_level = ReactiveProperty.new(1)

# Buildings
var building_tier1_level = ReactiveProperty.new(1)


func increase_energy(amount):
	_energy.Value += amount


func decrease_energy(amount):
	_energy.Value -= amount


# Player
func level_up():
	player_level.Value += 1


func get_required_energy(level: int) -> int:
	return level * 10


func get_job_per_click(level: int) -> int:
	return level


# Buildings
func buy_building_tier1():
	building_tier1_level.Value += 1


## Other
func _exit_tree() -> void:
	_energy.dispose()
	energy.dispose()
	required_job_points.dispose()
