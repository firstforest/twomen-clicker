extends Control

@export var _player_level_label: Label
@export var _player_jpc_label: Label
@export var _player_next_level_label: Label
@export var _spawner_level_label: Label


func _ready() -> void:
	GameState.player_level.subscribe(_update_label)
	GameState.spawner_level.subscribe(_update_spawner_label)


func _update_label(level) -> void:
	_player_level_label.text = "Level: %d" % level
	_player_jpc_label.text = "JPC: %d" % GameState.get_job_per_click(level)
	_player_next_level_label.text = "Next: %d" % GameState.get_required_energy(level)


func _update_spawner_label(level) -> void:
	_spawner_level_label.text = "Level: %d" % level
