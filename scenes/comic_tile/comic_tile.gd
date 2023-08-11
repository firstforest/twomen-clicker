extends MarginContainer

@export var comic: Comic
@export var purchase_se: AudioStream

signal on_pressed(comic: Comic)

var _is_purchased: bool = false


func _ready() -> void:
	$VBoxContainer/Title.text = comic.name

	var first_page: Texture2D = comic.pages[0]
	var image = first_page.get_image()
	image.resize(120, image.get_height() * 120 / image.get_width())
	image.crop(120, 120)
	var texture = ImageTexture.create_from_image(image)
	$VBoxContainer/TextureButton.texture_normal = texture
	image.fill(Color(0, 0, 0, 0.1))
	$VBoxContainer/TextureButton.texture_disabled = ImageTexture.create_from_image(image)
	$VBoxContainer/TextureButton.disabled = !_is_purchased


func _on_texture_button_pressed() -> void:
	print("Pressed")
	on_pressed.emit(comic)


func _on_button_pressed() -> void:
	if 100 <= GameState._energy.Value:
		GameState._energy.Value -= 100
		_is_purchased = true
		AudioManager.play(purchase_se.resource_path)
		$VBoxContainer/TextureButton.disabled = !_is_purchased
