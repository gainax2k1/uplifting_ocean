# dialog_manager.gd - Autoload singleton
extends Node

signal dialog_started(data: DialogData)
signal line_displayed(line: DialogLine)
signal choices_presented(choices: Array[DialogChoice])
signal dialogue_ended

var current_data: DialogData
var current_line: DialogLine
var is_active: bool = false

func start_dialogue(data: DialogData) -> void:
	current_data = data
	is_active = true
	dialog_started.emit(data)
	_show_line(data.start_id)

func _show_line(line_id: String) -> void:
	current_line = current_data.get_line(line_id)
	if current_line == null:
		end_dialogue()
		return

	# Execute side effects
	for effect in current_line.effects:
		_execute_effect(effect)

	# Filter choices by conditions
	var valid_choices: Array[DialogChoice] = []
	for choice in current_line.choices:
		if _check_conditions(choice.conditions):
			valid_choices.append(choice)

	if valid_choices.size() > 0:
		line_displayed.emit(current_line)
		choices_presented.emit(valid_choices)
	else:
		line_displayed.emit(current_line)

func advance() -> void:
	# Called when player clicks to continue (no choices)
	if current_line and current_line.next_id != "":
		_show_line(current_line.next_id)
	else:
		end_dialogue()

func select_choice(choice: DialogChoice) -> void:
	_show_line(choice.next_id)

func end_dialogue() -> void:
	is_active = false
	current_data = null
	current_line = null
	dialogue_ended.emit()
	
	
func _check_conditions(conditions: Array[String]) -> bool:
	for condition in conditions:
		if not _evaluate_condition(condition):
			return false
	return true

func _evaluate_condition(condition: String) -> bool:
	# Format: "has_item:iron_key" or "quest_complete:find_sword"'
	""" var parts := condition.split(":")
	match parts[0]:
		"has_item":
			return PlayerData.has_item(parts[1])
		"quest_complete":
			return QuestManager.is_complete(parts[1])
		"quest_active":
			return QuestManager.is_active(parts[1])
		"flag":
			return PlayerData.has_flag(parts[1])
		_:
			push_warning("Unknown condition: " + condition)
			return true
	"""
	pass
	
	
func _execute_effect(effect: String) -> void:
	"""
	var parts := effect.split(":")
	match parts[0]:
		"give_item":
			PlayerData.add_item(parts[1])
		"start_quest":
			QuestManager.start_quest(parts[1])
		"set_flag":
			PlayerData.set_flag(parts[1])
		"give_xp":
			PlayerData.add_xp(int(parts[1]))
		_:
			push_warning("Unknown effect: " + effect)
	"""
	pass
	
"""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
"""
