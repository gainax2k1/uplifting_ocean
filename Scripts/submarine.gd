extends Node2D

@onready var submarine_layer = %SubAnimation
var sub_sunk_pos = Vector2(290.0, 550.0) #-105.0, 95.0)
var sub_raised_pos = Vector2(-200.0, -200.0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	submarine_layer.play("sink")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
