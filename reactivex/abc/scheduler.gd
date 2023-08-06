class_name SchedulerBase

## A scheduler performs a scheduled action at some future point.
##
## Schedules actions for execution at some point in the future.
## [color=yellow]Important![/color] We will always use DateTime/DeltaTime in Seconds!

## Returns the current point in time (timestamp)
func now() -> float:
	GDRx.exc.NotImplementedException.Throw()
	return -1.0

## Schedule a new action for future execution
func schedule(_action : Callable, _state = null) -> DisposableBase:
	GDRx.exc.NotImplementedException.Throw()
	return null

## Schedule a new action for future execution in [code]duetime[/code] seconds.
func schedule_relative(_duetime, _action : Callable, _state = null) -> DisposableBase:
	GDRx.exc.NotImplementedException.Throw()
	return null

## Schedule a new action for future execution at [code]duetime[/code].
func schedule_absolute(_duetime, _action : Callable, _state = null) -> DisposableBase:
	GDRx.exc.NotImplementedException.Throw()
	return null

## Converts a timestamp-dictionary to Unix-time
static func to_seconds(_datetime : Dictionary) -> float:
	GDRx.exc.NotImplementedException.Throw()
	return -1.0
