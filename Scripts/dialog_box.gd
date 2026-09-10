extends Panel

@onready var dialogue_text : RichTextLabel = %DialogText
@onready var npc_icon : AnimatedSprite2D = %NPCIcon



func _ready() -> void:
	
	pass # Replace with function body.

func initalize_with_npc (npc):
	dialogue_text.text = "" #clears default text
	# set npc icon
	
	pass
	
