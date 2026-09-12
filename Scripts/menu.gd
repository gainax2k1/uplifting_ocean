extends Control

@onready var bg_music = %BGMusic






func _on_exit_pressed() -> void:
	get_tree().quit()
