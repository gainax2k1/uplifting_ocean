# dialog_choice.gd
class_name DialogChoice
extends Resource

@export var text: String
@export var next_id: String
@export var conditions: Array[String] = []
