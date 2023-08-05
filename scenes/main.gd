extends Node

@export var onigiri_scene: PackedScene
@onready var spawn_point = $SpawnPoint


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawner_spawner_clicked():
	var onigiri: Onigiri = onigiri_scene.instantiate()
	onigiri.position = spawn_point.position
	onigiri.apply_central_impulse(Vector2(randf_range(-100, 100), randf_range(-200, -700)))
	add_child(onigiri)
