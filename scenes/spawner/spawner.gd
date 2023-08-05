extends Area2D

@onready var animation_player = $AnimationPlayer

signal spawner_clicked


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			animation_player.stop(true)
			animation_player.play("clicked")
			spawner_clicked.emit()
			print("clicked")
