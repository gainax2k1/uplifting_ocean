# dialogue_data.gd
class_name DialogData
extends Resource

@export var id: String
@export var lines: Array[DialogLine] = []
@export var start_id: String

func get_line(line_id: String) -> DialogLine:
	for line in lines:
		if line.id == line_id:
			return line
	return null
