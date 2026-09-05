extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/uplifting_ocean.tscn")
	



func _on_sound_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.



func _on_exit_pressed() -> void:
	get_tree().quit()
