extends AudioStreamPlayer2D

@onready var bgmusic = %BGMusic

func _on_sound_toggled(toggled_on: bool) -> void:
	bgmusic.stream_paused = !bgmusic.stream_paused
