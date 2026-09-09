extends Node

@export var full_script : FullScript

@onready var DialogBox = %DialogBox
@onready var NPC_Icon = %NPCIcon
@onready var DialogText = %DialogText
@onready var SpeakerLabel = %SpeakerLabel
@onready var done_button = %DoneButton



func _ready() -> void:
	DialogBox.hide()
	start_dialog(full_script.Dialogues[0], 0)
	
	pass
	
func start_dialog(dialog:Dialogue, dialog_index:int):
	if dialog_index == null:
		dialog_index = 0
	
	DialogBox.show()
	NPC_Icon.texture = dialog.NPC_Icon
	SpeakerLabel.text = dialog.NPC_Name
	DialogText.text = dialog.Dialogs[dialog_index]
	
	pass

func _on_done_button_pressed() -> void:
	DialogBox.hide()
