extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var _direction = -1


func _ready() -> void:
	animation_player.play("walk")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		velocity.x = _direction * SPEED

	if position.x < 0:
		_direction = 1
		sprite.flip_h = true
	elif position.x > 1200:
		_direction = -1
		sprite.flip_h = false

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Onigiri:
		body.queue_free()
