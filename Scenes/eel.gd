extends AnimatedSprite2D

@onready var eel_ani = %Eel

var eel_counter = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	eel_counter += delta
	if eel_counter == 180:
		eel_counter = 0	
	eel_ani.position.y = eel_ani.global_position.y + cos(eel_counter) *.2

	
