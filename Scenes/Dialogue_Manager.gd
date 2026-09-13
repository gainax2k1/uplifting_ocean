extends Node


@export var full_script: FullScript

@onready var DialogBox = %DialogBox
@onready var NPC_Icon = %NPCIcon
@onready var DialogText = %DialogText
@onready var SpeakerLabel = %SpeakerLabel
@onready var done_button = %DoneButton
@onready var cont_button = %ContinueButton
#@onready var power_gauge  = %Sub2D.get_node("%PowerGauge")
@onready var sub_animation = %Sub2D.get_node("%SubAnimation")
@onready var prop_animation = %prop_anim
@onready var FishAnimation = %Sub2D.get_node("%FishAnimation")
@onready var bgmusic = %Menu.get_node("%BGMusic")
@onready var ask_for_help = %Sub2D.get_node("%AskForHelp")
@onready var victory = %Victory
@export var Caller: Node

#@onready var damage_sprite = %Sub2D.get_node("%Damage")



var current_NPC_index = 0
var current_dialog_index = 0
var current_dialog = 0
var current_dialog_max = 0

func _ready() -> void:
	DialogBox.hide()
	ask_for_help.visible = false
	FishAnimation.play("star_ani_1")
	
func trans_switch(trans_name:String) -> void:
	match trans_name:
		"Starfish":
			ask_for_help.visible = false
			FishAnimation.play("star_ani_2")
			ask_for_help.set_text("Well, looks like they fixed the hole \n
				but I'm still feeling stressed out...")
			
			#FishAnimation.play("eel_ani_1")
			return
			
		"Puffer":
			FishAnimation.play("puff_ani_2")
			
			
			
		"Eel":
			ask_for_help.visible = false
			#%PowerGauge.Fill_gauge()
			FishAnimation.play("eel_ani_2")
			
			return
	
		"Ending":
			ask_for_help.disabled = true
			ask_for_help.visible = false
			#CALL ENDING...????????????????????
			#power_gauge.play("power-ani")
			sub_animation.play("raise")
			#prop_animation.visible = true
			#animate prop, show prop
			bgmusic.stream_paused = true
			victory.play(0.0)
			
			
		_: #wildcard
			return
	
	return
	

func start_dialog(dialog:Dialogue):
	current_dialog = dialog
	current_dialog_max = len(current_dialog.Dialogs)-1
	done_button.disabled = true
	cont_button.disabled = false
	if current_dialog_index == null:
		current_dialog_index = 0
	
	DialogBox.show()
	NPC_Icon.play(current_dialog.NPC_Icon)
	SpeakerLabel.text = current_dialog.NPC_Name
	DialogText.text = current_dialog.Dialogs[current_dialog_index]

func cont_dialog():
	if current_dialog_index > current_dialog_max:
		return
	DialogText.text = current_dialog.Dialogs[current_dialog_index]
	pass

func _on_continue_button_pressed() -> void:
	current_dialog_index += 1
	if current_dialog_index + 1 > current_dialog_max:
		cont_button.disabled = true
		done_button.disabled = false
	cont_dialog()
	pass # Replace with function body.

func _on_done_button_pressed() -> void:
	current_dialog_index = 0
	if (current_NPC_index + 1) < len(full_script.Dialogues):
		trans_switch(current_dialog.NPC_Name)
		#when increment, call transition (finish starfish, finish puffer, etc...)
		current_NPC_index += 1
		#ask_for_help.show()
	else:
		FishAnimation.play("puff_ani_2")
		pass
		#trans_switch("Ending")
		
	DialogBox.hide()

func _on_ask_for_help_pressed() -> void:
	ask_for_help.hide()
	start_dialog(full_script.Dialogues[current_NPC_index])
	pass # Replace with function body.
