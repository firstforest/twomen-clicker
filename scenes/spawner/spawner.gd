extends Area2D

@export var clicked_se: AudioStream
@onready var animation_player = $AnimationPlayer
@onready var progress_bar = $ProgressBar

signal spawner_job_fulfilled

var current_job_points: float = 0


func _process(delta: float) -> void:
	if GameState.building_tier1_level.Value > 0:
		_add_job_points(GameState.building_tier1_level.Value * delta)


func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			animation_player.stop(true)
			animation_player.play("clicked")
			AudioManager.play(clicked_se.resource_path)
			_add_job_points(GameState.get_job_per_click(GameState.player_level.Value))


func _add_job_points(points) -> void:
	current_job_points += points
	if current_job_points >= GameState.required_job_points.Value:
		spawner_job_fulfilled.emit()
		current_job_points = 0
	var progress = current_job_points / GameState.required_job_points.Value * 100
	progress_bar.value = progress
