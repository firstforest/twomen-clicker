extends ReactiveCollectionBase
class_name ReadOnlyReactiveCollection

var _collection : ReactiveCollectionBase

func _init(collection : ReactiveCollectionBase):
	self._collection = collection
	self._observe_add = collection.ObserveAdd
	self._observe_move = collection.ObserveMove
	self._observe_remove = collection.ObserveRemove
	self._observe_replace = collection.ObserveReplace
	self._observe_reset = collection.ObserveReset

func ObserveCountChanged(_notify_current_count : bool = false) -> Observable:
	return self._collection.ObserveCountChanged(_notify_current_count)

## Override from [Comparable]
func eq(other) -> bool:
	if other is ReadOnlyReactiveCollection:
		return GDRx.eq(self._collection, other._collection)
	return GDRx.eq(self._collection, other)

func add_item(_item) -> int:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return -1

func remove_item(_item) -> int:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return -1

func remove_at(_index : int) -> Variant:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func replace_item(_item, _with) -> int:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return -1

func replace_at(_index : int, _item) -> Variant:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func swap(_idx1 : int, _idx2 : int) -> Tuple:
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func move_to(_curr_index : int, _new_index : int):
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func insert_at(_index : int, _elem):
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func at(index : int):
	return self._collection.at(index)

func find(item) -> int:
	return self._collection.find(item)

func reset():
	GDRx.raise_message("Tried to write to a ReadOnlyReactiveProperty")
	return null

func to_list() -> Array:
	return self._collection.to_list()

func iter() -> Iterator:
	return self._collection.iter()

func size() -> int:
	return self._collection.size()

func dispose():
	self._collection.dispose()
