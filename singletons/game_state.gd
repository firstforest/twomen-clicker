extends Node

var _energy = ReactiveProperty.new(0)
var energy = _energy.to_readonly()

# Spawner
var required_job_points = ReactiveProperty.new(5)

# Player
var job_per_click = ReactiveProperty.new(1)


func increase_energy(amount):
	_energy.Value += amount


func decrease_energy(amount):
	_energy.Value -= amount


func add_job_per_click(amount):
	job_per_click.Value += amount


func _exit_tree() -> void:
	_energy.dispose()
	energy.dispose()
	required_job_points.dispose()
