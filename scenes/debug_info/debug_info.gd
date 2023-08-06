extends Control

@export var _job_per_click_label: Label


func _ready() -> void:
	GameState.job_per_click.subscribe(_update_jpc_label)


func _update_jpc_label(point: int) -> void:
	_job_per_click_label.text = "JPC: %d" % point
