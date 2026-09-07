
extends CanvasLayer

@onready var panel: PanelContainer = %DialogBox
@onready var speaker_label: Label = %DialogBox/VBox/SpeakerLabel
@onready var text_label: RichTextLabel = %DialogBox/VBox/DialogText
@onready var choices_container: VBoxContainer = %DialogBox/VBox/Choices

#var choice_button_scene: PackedScene = preload("res://ui/choice_button.tscn")

func _ready() -> void:
	panel.visible = false
	DialogManager.dialog_started.connect(_on_started)
	DialogManager.line_displayed.connect(_on_line)
	DialogManager.choices_presented.connect(_on_choices)
	DialogManager.dialog_ended.connect(_on_ended)

func _on_started(_data: DialogData) -> void:
	panel.visible = true


func _on_line(line: DialogLine) -> void:
	speaker_label.text = line.speaker
	text_label.text = line.text
	_clear_choices()

func _on_choices(choices: Array[DialogChoice]) -> void:
	for choice in choices:
		var button: Button = choice_button_scene.instantiate()
		button.text = choice.text
		button.pressed.connect(func(): DialogManager.select_choice(choice))
		choices_container.add_child(button)

func _on_ended() -> void:
	panel.visible = false
	_clear_choices()

func _clear_choices() -> void:
	for child in choices_container.get_children():
		child.queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and DialogManager.is_active:
		if choices_container.get_child_count() == 0:
			DialogueManager.advance()

"""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
"""
