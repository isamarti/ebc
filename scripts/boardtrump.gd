extends Control

@onready var displayQuestion = $Question
@onready var listItems = $ItemList
@export var questions_file=""
@export var max_questions=0
@export var num_questions=0


var questions:Array
var question: Dictionary
var selected:Array
var numQuestions = 0
var correct = 0
var rng = RandomNumberGenerator.new()
var subject = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questions=read_json_file(questions_file)
	subject = get_parent().name
	displayQuestion.text= subject
	# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_questionaire():
	refresh_screen()

func refresh_screen():
	if(numQuestions<num_questions):
		var max_index = questions.size() - 1
		var random_index:int = rng.randi_range(0, max_index)
		while(selected.has(random_index)):
			random_index = rng.randi_range(0, max_index)
		selected.append((random_index))
		show_question((random_index))
	else:
		numQuestions=0
		show_result()

func show_result():
	listItems.hide()
	get_parent().end_questionnaire(correct)
	correct = 0	

func show_question(index):
	listItems.show()
	listItems.clear()
	question = questions[index]
	displayQuestion.text = question.question
	var options = question.options
	for option in options:
		listItems.add_item(option)

func read_json_file(filename):
	var json_as_text = FileAccess.get_file_as_string(filename)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict


func _on_item_list_item_selected(index: int) -> void:
	print(question.options[question.correctOptionIndex])
	if (index == question.correctOptionIndex):
		correct +=1
	numQuestions+=1
	refresh_screen()	
	
