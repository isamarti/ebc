extends Node2D


@export var dialogue:DialogueResource

func _ready() -> void:
	$Board.visible=false
	DialogueManager.show_dialogue_balloon(dialogue,"colegio")


func start_questionnaire():
	$Board.visible=true
	$Board.start_questionaire()

func end_questionnaire(correct:int):
	print("End questionnaire")
	if(correct<3):
		DialogueManager.show_dialogue_balloon(dialogue, "cole_lose")
	else: 
		DialogueManager.show_dialogue_balloon(dialogue, "cole_win")
		Globals.justicia=true
		Globals.update_sellos()
		
func out():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
