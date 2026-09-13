extends AnimationPlayer

@onready var damage: Sprite2D = %Subby.get_node("%Damage")
@onready var BigPuffer: Sprite2D = %Subby.get_node("%BigPuffer")
@onready var gauge  = $"../../Sub2D".get_node("%PowerGauge")
@onready var ask_for_help = $"../AskForHelp"
@onready var FishAnimation = %FishAnimation
@onready var Starfish = %Starfish
@onready var cat = $"../../Sub2D".get_node("%Cat")

@onready var prop_animation = $"../../Sub2D".get_node("%prop_anim")
@onready var sub_animation = $"../../Sub2D".get_node("%SubAnimation")
@onready var bgmusic = $"../../Menu".get_node("%BGMusic")
@onready var victory = $"../../Dialog".get_node("%Victory")
@onready var big_puffer = $"../../Sub2D".get_node("%PufferBig")
@export var subby: Sprite2D

func _ready() -> void:
	pass

func _on_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	if anim_name == "star_ani_1":
		ask_for_help.visible = true
		return
		
	if anim_name == "star_ani_2":
		Starfish.visible = false
		damage.texture = load("res://Assets/Sprites/starfish.png")
		FishAnimation.play("eel_ani_1")
		cat.animation = "cat-mood-medium"
		return
		
	if anim_name == "eel_ani_1":
		ask_for_help.visible = true
		cat.animation = "cat-mood-sad"
		return
	if anim_name == "eel_ani_2":
		gauge.play("power-ani")
		prop_animation.show()		
		cat.animation = "cat-mood-medium"
		FishAnimation.play("eel_ani_3")
		
	if anim_name == "eel_ani_3":
		ask_for_help.set_text("Ok, they recharged the power. \n
				I still feel really down and could use a lift. \n
				I still need help...")
		FishAnimation.play("puff_ani_1")
		cat.animation = "cat-mood-sad"
		return
	
	if anim_name == "puff_ani_1":
		ask_for_help.visible = true
		cat.animation = "cat-mood-medium"
		return
		
	if anim_name == "puff_ani_2":
		cat.animation = "cat-mood-happy"
		FishAnimation.play("RESET")
		big_puffer.show()
		print("ending")
		ending()
		return
		
	if anim_name == "eel_ani_4":
		ask_for_help.set_text("Thanks for playing! <3")
		ask_for_help.visible = true
		#ask_for_help.disable = true
	
	return
	
func ending() -> void:
	ask_for_help.disabled = true
	ask_for_help.visible = false
	sub_animation.play("raise")
	bgmusic.stream_paused = true
	victory.play(0.0)


func _on_sub_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "raise":
		FishAnimation.play("eel_ani_4")
