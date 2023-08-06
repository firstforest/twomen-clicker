extends RigidBody2D
class_name Onigiri

@export var eaten_se: AudioStream


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			eaten()


func eaten() -> void:
	AudioManager.play(eaten_se.resource_path)
	queue_free()
