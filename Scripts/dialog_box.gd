extends Panel

@onready var dialog : Node2D = get_node("res://Scenes/dialog.tscn")
@onready var game_manager = get_node("/root/Main/GameManager")
@onready var dialogue_text : RichTextLabel = get_node("DialogueText")
@onready var npc_icon : TextureRect = get_node("NPCIcon")
@onready var done_button : Button = get_node("DoneButton")

func _ready() -> void:
	pass # Replace with function body.

func initalize_with_npc (npc):
	dialogue_text.text = "" #clears default text
	# set npc icon
	
	
	pass
	
	


func _on_done_button_pressed() -> void:
	hide()
