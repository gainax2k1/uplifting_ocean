# event_bus.gd - Autoload singleton
class_name EventBusClass
extends Node

# Generic event signal
signal event(event_name: String, data: Dictionary)

# Specific typed signals for common events
signal quest_started(quest_id: String)
signal quest_completed(quest_id: String)
signal quest_failed(quest_id: String)
signal objective_completed(quest_id: String, objective_id: String)
signal dialog_event(event_name: String)
signal item_acquired(item_id: String, quantity: int)
signal reputation_changed(faction: String, amount: int)

var _listeners: Dictionary = {}  # event_name -> Array[Callable]


func broadcast(event_name: String, data: Dictionary = {}) -> void:
	event.emit(event_name, data)

	# Fire specific typed signals based on event name prefix
	if event_name.begins_with("quest_start:"):
		quest_started.emit(event_name.get_slice(":", 1))
	elif event_name.begins_with("quest_complete:"):
		quest_completed.emit(event_name.get_slice(":", 1))
	elif event_name.begins_with("quest_fail:"):
		quest_failed.emit(event_name.get_slice(":", 1))
	elif event_name.begins_with("objective_complete:"):
		var parts := event_name.split(":")
		if parts.size() >= 3:
			objective_completed.emit(parts[1], parts[2])
	elif event_name.begins_with("item:"):
		var parts := event_name.split(":")
		var quantity := int(parts[2]) if parts.size() >= 3 else 1
		item_acquired.emit(parts[1], quantity)

	# Call registered listeners
	if _listeners.has(event_name):
		for callback in _listeners[event_name]:
			if callback.is_valid():
				callback.call(data)


func listen(event_name: String, callback: Callable) -> void:
	if not _listeners.has(event_name):
		_listeners[event_name] = []
	_listeners[event_name].append(callback)


func unlisten(event_name: String, callback: Callable) -> void:
	if _listeners.has(event_name):
		_listeners[event_name].erase(callback)
