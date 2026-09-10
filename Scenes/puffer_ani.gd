extends AnimatedSprite2D

@onready var puff_ani = %Puffer

var puff_counter = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	puff_counter += delta
	if puff_counter == 180:
		puff_counter = 0	
	puff_ani.position.y = puff_ani.global_position.y + sin(puff_counter) *.2

	
