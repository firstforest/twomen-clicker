extends Node

var energy = ReactiveProperty.new(0)
var required_job_points = ReactiveProperty.new(5)


func add_energy(amount):
	energy.Value += amount


func _exit_tree() -> void:
	energy.dispose()
	required_job_points.dispose()
