extends AnimatedSprite2D

@onready var gauge = %PowerGauge

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func Fill_gage() -> void:
	gauge.animation.play
	
	
