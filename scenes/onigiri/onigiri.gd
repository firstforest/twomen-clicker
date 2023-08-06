extends RigidBody2D
class_name Onigiri

@export var eaten_se: AudioStream
var _level: int = 1
var _hp: int = 1


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			eaten()


func eaten() -> void:
	_hp -= 1
	if _hp <= 0:
		AudioManager.play(eaten_se.resource_path)
		GameState.increase_energy(GameState.get_onigiri_energy(_level))
		queue_free()


func set_level(level: int) -> void:
	_level = level
	_hp = level * 2

	var sprite: Sprite2D = $Sprite2D
	if _level >= 2:
		sprite.modulate = Color(1, 0.5, 0.5)
