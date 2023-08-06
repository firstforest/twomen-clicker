extends Node

var energy = ReactiveProperty.new(0)


func add_energy(amount):
	energy.Value += amount


func _exit_tree() -> void:
	energy.dispose()
