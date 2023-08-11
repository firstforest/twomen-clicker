extends BoxContainer

@export var _level_label: Label
@export var _speed_label: Label


func _ready() -> void:
	GameState.aoi_level.subscribe(_update_label)
	GameState.aoi_speed.subscribe(_update_speed_label)


func _update_label(level: int) -> void:
	_level_label.text = "Level: %d" % level


func _update_speed_label(speed: float) -> void:
	_speed_label.text = "食事: %.3f 秒毎" % (1/speed)


func _on_level_up_button_pressed() -> void:
	GameState.level_up_aoi()


func _on_speed_up_button_pressed() -> void:
	GameState.speed_up_aoi()
