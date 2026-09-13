extends AnimationPlayer

@onready var damage_sprite = %Damage
@onready var ask_for_help = $"../AskForHelp"
@onready var FishAnimation = %FishAnimation
@onready var Starfish = %Starfish
@onready var BigPuffer = %BigPuffer
#@onready var ask_for_help = %Sub2D.get_node("%AskForHelp")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	if anim_name == "star_ani_1":
		ask_for_help.visible = true
		return
		
	if anim_name == "star_ani_2":
		Starfish.visible = false
		damage_sprite.texture = load("res://Assets/Sprites/starfish.png")
		#FishAnimation.play("eel_ani_1")
		return
		
	if anim_name == "eel_ani_1":
		#FishAnimation.stop()
		#FishAnimation.current_animation ="eel_ani_2"
		ask_for_help.visible = true
		return
		
	if anim_name == "eel_ani_2":
		#FishAnimation.stop()
		ask_for_help.set_text("Ok, they recharged the power. \n
				I still feel really down and could use a lift. \n
				I still need help...")
		#eel does whatever
		#FishAnimation.current_animation = "puff_ani_1"
		#FishAnimation.play("puff_ani_1")
		return
	
	if anim_name == "puff_ani_1":
		#FishAnimation.stop()
		ask_for_help.visible = true
		return
		
	if anim_name == "puff_ani_2":
		#self.play("RESET")
		#%Puffer.visible = false
		FishAnimation.stop()
		BigPuffer.visible = true
		
		print("ending")
		
		%Dialog.trans_switch("Ending")
		return
	return
	
