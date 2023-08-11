extends MarginContainer

@export var comic: Comic


func _ready() -> void:
	$VBoxContainer/Title.text = comic.name

	var first_page: Texture2D = comic.pages[0]
	var image = first_page.get_image()
	image.resize(120, image.get_height() * 120 / image.get_width())
	image.crop(120, 120)
	var texture = ImageTexture.create_from_image(image)
	$VBoxContainer/TextureButton.texture_normal = texture
