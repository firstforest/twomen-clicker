extends Resource
class_name Comic

enum StartPage {
	LEFT,
	RIGHT,
}

@export var name: String
@export var start_page: StartPage = StartPage.LEFT
@export var pages: Array[Texture2D]
