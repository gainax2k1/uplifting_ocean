extends Node2D

@onready var submarine_layer = %SubAnimation
@onready var AskForHellp = %AskForHelp
#var sub_sunk_pos = Vector2(290.0, 550.0) #-105.0, 95.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AskForHellp.hide()
	submarine_layer.play("sink")
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sub_animation_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
