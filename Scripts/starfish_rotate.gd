extends Sprite2D


@onready var starfish_ani = %Starfish

var rotation_angle = 0.0

#@onready var dialog = %Dialog.trans_
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	rotation_angle += .5
	starfish_ani.rotation_degrees = rotation_angle
	
