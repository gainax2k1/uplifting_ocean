extends AnimationPlayer

@onready var damage: Sprite2D = %Subby.get_node("%Damage")
@onready var BigPuffer: Sprite2D = %Subby.get_node("%BigPuffer")
#@onready var gauge = %Subby.get_node("%PowerGauge")
#@onready var power_gauge  = %Sub2D.get_node("%PowerGauge")
@onready var ask_for_help = $"../AskForHelp"
@onready var FishAnimation = %FishAnimation
@onready var Starfish = %Starfish

@onready var sub_animation = $"../../Sub2D".get_node("%SubAnimation")
@onready var bgmusic = $"../../Menu".get_node("%BGMusic")
@onready var victory = $"../../Dialog".get_node("%Victory")
@onready var big_puffer = $"..Subby".get_node("%PufferBig")
#@onready var big_puffer: Sprite2D = %PufferBig
@export var subby: Sprite2D

#@onready var dialog = %Dialog.get_node()
#@onready var BigPuffer = %BigPuffe

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
		damage.texture = load("res://Assets/Sprites/starfish.png")
		FishAnimation.play("eel_ani_1")
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
		#gauge.play("power-ani")
		#FishAnimation.current_animation = "puff_ani_1"
		FishAnimation.play("puff_ani_1")
		return
	
	if anim_name == "puff_ani_1":
		#FishAnimation.stop() 
		ask_for_help.visible = true
		return
		
	if anim_name == "puff_ani_2":
		#self.play("RESET")
		#%Puffer.visible = false
		FishAnimation.play("RESET")
		big_puffer.show()
		#BigPuffer.visible = true
		#%PufferBig.visble = true
		print("ending")
		ending()
		#Caller.call(function_name)
		#%Dialog.MY_
		#%Dialog.trans_switch("Ending")
		return
	return
	
func ending() -> void:
	ask_for_help.disabled = true
	ask_for_help.visible = false
	#CALL ENDING...????????????????????
	#power_gauge.play("power-ani")
	sub_animation.play("raise")
	#prop_animation.visible = true
	#animate prop, show prop
	bgmusic.stream_paused = true
	victory.play(0.0)
