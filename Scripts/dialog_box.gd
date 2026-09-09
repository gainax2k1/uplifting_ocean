extends Panel

@onready var dialog : Node2D = get_node("res://Scenes/dialog.tscn")
@onready var dialogue_text : RichTextLabel = %DialogText
@onready var npc_icon : TextureRect = %NPCIcon
@onready var done_button : Button = %DDoneButton



func _ready() -> void:
	
	pass # Replace with function body.

func initalize_with_npc (npc):
	dialogue_text.text = "" #clears default text
	# set npc icon
	
	
	pass
	
	
func _on_dialog_started():
	visible = true

func _on_done_button_pressed() -> void:
	hide()
