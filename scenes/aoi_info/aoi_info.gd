extends BoxContainer

@export var _level_label: Label


func _ready() -> void:
	GameState.aoi_level.subscribe(_update_label)


func _update_label(level: int) -> void:
	_level_label.text = "Level: %d" % level


func _on_level_up_button_pressed() -> void:
	GameState.level_up_aoi()
