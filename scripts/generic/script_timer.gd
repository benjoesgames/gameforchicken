class_name ScriptTimer

static var timers = []

# Call this in the _process of your root node
# it will check all the timers to see if they have ended
# If they have it will call their callback
static func update_timers() -> void:
	if timers.size() == 0:
		return

	var time_now = Time.get_unix_time_from_system()

	timers = timers.filter(func(t):
		if time_now >= t[0]:
			t[1].call()
			return false
		return true)

static func create_timer(wait: float, callback: Callable) -> void:
	var stop_time = Time.get_unix_time_from_system() + wait
	timers.push_back([stop_time, callback])
