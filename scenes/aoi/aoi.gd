extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var mogumogu = $MoguMoguEffect

const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var _direction = -1
var _onigiris: Array[Onigiri] = []
var _eat_timer = 0


func _ready() -> void:
	animation_player.play("walk")


func _process(delta: float) -> void:
	_eat_timer += delta
	if _eat_timer >= (1/GameState.aoi_speed.Value):
		_eat_timer = 0
		for onigiri in _onigiris:
			if is_instance_valid(onigiri):
				onigiri.eaten(GameState.aoi_level.Value)
			else:
				_onigiris.erase(onigiri)


func _physics_process(delta: float) -> void:
	mogumogu.visible = not _onigiris.is_empty()
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
		_onigiris.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Onigiri:
		_onigiris.erase(body)
