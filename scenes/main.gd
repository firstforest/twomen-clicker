extends Node

@export var onigiri_scene: PackedScene
@onready var spawn_point = $SpawnPoint


func _on_spawner_spawner_job_fulfilled() -> void:
	var onigiri: Onigiri = onigiri_scene.instantiate()
	onigiri.position = spawn_point.position
	onigiri.apply_central_impulse(Vector2(randf_range(-100, 100), randf_range(-200, -700)))
	onigiri.set_level(GameState.spawner_level.Value)
	add_child(onigiri)


func _on_upgrade_jpc_pressed() -> void:
	var required_energy = GameState.get_required_energy(GameState.player_level.Value)
	if required_energy <= GameState.energy.Value:
		GameState.decrease_energy(required_energy)
		GameState.level_up()


func _on_buy_button_pressed() -> void:
	var required_energy = GameState.get_required_energy(GameState.building_tier1_level.Value)
	if required_energy <= GameState.energy.Value:
		GameState.decrease_energy(required_energy)
		GameState.buy_building_tier1()
