extends Node
class_name comic_viewer

enum ScrollDirection { NONE, LEFT, RIGHT }

@export var comic: Comic
@export var scroll_container: ScrollContainer
@export var page_contaner: HBoxContainer

signal on_close_button_pressed

var page_index: int = 0
var animation_offset: int = 0
var scroll_direction: ScrollDirection = ScrollDirection.NONE


func init(c: Comic) -> comic_viewer:
	comic = c
	return self


func _ready() -> void:
	var pages = comic.pages.duplicate()
	pages.reverse()
	for page in pages:
		var texture_rect = TextureRect.new()
		texture_rect.texture = page
		texture_rect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
		page_contaner.add_child(texture_rect)
	call_deferred("_update_page")


func _process(delta: float) -> void:
	animation_offset = max(0, animation_offset - delta * 2000)
	if animation_offset == 0:
		scroll_direction = ScrollDirection.NONE

	if scroll_direction == ScrollDirection.NONE:
		return

	_update_page()


func _update_page() -> void:
	var target_value = (comic.pages.size() - 1 - page_index) * (650 + 24)
	scroll_container.scroll_horizontal = (
		target_value + animation_offset * (1 if scroll_direction == ScrollDirection.LEFT else -1)
	)


func _on_next_button_pressed() -> void:
	if page_index == comic.pages.size() - 1:
		return
	page_index += 1
	animation_offset = 650
	scroll_direction = ScrollDirection.LEFT


func _on_prev_button_pressed() -> void:
	if page_index == 0:
		return
	page_index -= 1
	animation_offset = 650
	scroll_direction = ScrollDirection.RIGHT


func _on_button_pressed() -> void:
	on_close_button_pressed.emit()
