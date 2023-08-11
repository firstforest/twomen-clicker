extends Node

@export var onigiri_scene: PackedScene
@export var comic_viewer: PackedScene
@onready var spawn_point = $SpawnPoint
@onready var overlay = $Overlay

var _is_comic_viewer_shown: bool = false


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


func _on_level_up_spawner_button_pressed() -> void:
	GameState.level_up_spawner()


func _on_check_button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		overlay.add_child(comic_viewer.instantiate())
	else:
		overlay.remove_child(overlay.get_child(0))


func _on_comic_tile_on_pressed(comic: Comic) -> void:
	if not _is_comic_viewer_shown:
		var cv = comic_viewer.instantiate().init(comic)
		cv.connect("on_close_button_pressed", _on_comic_viewer_close_button_pressed)
		overlay.add_child(cv)
		_is_comic_viewer_shown = true


func _on_comic_viewer_close_button_pressed() -> void:
	if _is_comic_viewer_shown:
		overlay.remove_child(overlay.get_child(0))
		_is_comic_viewer_shown = false
