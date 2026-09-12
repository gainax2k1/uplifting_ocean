extends AudioStreamPlayer2D

@onready var button_sound = %ButtonSound

func _on_continue_button_button_down() -> void:
	button_sound.play(0.0)

func _on_done_button_button_down() -> void:
	button_sound.play(0.0)
