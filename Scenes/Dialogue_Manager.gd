extends Node

@export var full_script : FullScript

@onready var DialogBox = %DialogBox
@onready var NPC_Icon = %NPCIcon
@onready var DialogText = %DialogText
@onready var SpeakerLabel = %SpeakerLabel
@onready var done_button = %DoneButton
@onready var cont_button = %ContinueButton
@onready var power_gauge = %Sub2D.get_node("%PowerGauge")
@onready var sub_animaation = %Sub2D.get_node("%SubAnimation")
@onready var bgmusic = %Menu.get_node("%BGMusic")
@onready var victory = %Victory


var current_NPC_index = 0
var current_dialog_index = 0
var current_dialog = null
var current_dialog_max = 0

func _ready() -> void:
	DialogBox.hide()
	pass
	
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
	if current_dialog_index> current_dialog_max:
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
		current_NPC_index += 1
	else:
		%AskForHelp.disabled = true
		%AskForHelp.visible = false
		#CALL ENDING...????????????????????
		power_gauge.play("power-ani")
		sub_animaation.play("raise")
		bgmusic.stream_paused = true
		victory.play(0.0)
		
	DialogBox.hide()

func _on_ask_for_help_pressed() -> void:
	start_dialog(full_script.Dialogues[current_NPC_index])
	pass # Replace with function body.
