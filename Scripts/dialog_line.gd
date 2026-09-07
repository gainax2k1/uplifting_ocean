# dialogue_line.gd
class_name DialogLine
extends Resource

@export var id: String
@export var speaker: String
@export var text: String
@export var choices: Array[DialogChoice] = []
@export var next_id: String = ""  # Auto-advance to this line (if no choices)
@export var conditions: Array[String] = []  # Conditions that must be true
@export var effects: Array[String] = []  # Side effects when this line plays
