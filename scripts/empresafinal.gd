extends Node2D


@export var dialogue:DialogueResource

func _ready() -> void:
	$Board.visible=false


func start_questionnaire():
	$Board.visible=true
	$Board.start_questionaire()

func end_questionnaire(correct:int):
	print("End questionnaire")
	if(correct<10):
		DialogueManager.show_dialogue_balloon(dialogue, "tramp_lose")
		
	else: 
		DialogueManager.show_dialogue_balloon(dialogue, "tramp_win")

func win():
	get_tree().change_scene_to_file("res://scenes/win.tscn")
	
func lose():
	get_tree().change_scene_to_file("res://scenes/lose.tscn")	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		DialogueManager.show_dialogue_balloon(dialogue,"tramp")
