extends Control

@export var label: Label


func _ready() -> void:
	GameState.energy.subscribe(_update_energy)


func _update_energy(energy: int) -> void:
	label.text = "%d" % energy
