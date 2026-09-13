extends AnimationPlayer

@onready var damage_sprite = %Damage
@onready var ask_for_help = $"../AskForHelp"
@onready var starfish_ani = %Starfish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	if anim_name == "star_ani":
		ask_for_help.visible = true
	if anim_name == "star_ani_2":
		starfish_ani.hide()
		damage_sprite.texture = load("res://Assets/Sprites/starfish.png")
	
	if anim_name == "puff_ani_1":
		ask_for_help.visible = true
	if anim_name == "puff_ani_2":
		%Puffer.hide()
		%PufferBig.show()
		
		%Dialog.trans_switch("Ending")
		pass # Replace with function body.
