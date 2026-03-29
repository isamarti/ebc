extends Node2D


@export var dialogue:DialogueResource

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue,"ayuntamiento")



func start_questionnaire():
	$Board.start_questionaire()

func end_questionnaire(correct:int):
	print("End questionnaire")
	if(correct<3):
		DialogueManager.show_dialogue_balloon(dialogue, "ayu_lose")
	else: 
		DialogueManager.show_dialogue_balloon(dialogue, "ayu_win")
		Globals.transparencia=true
