extends Node2D

@export var dialogue:DialogueResource

var sellos=0
var primera=true


func _ready() -> void:
	if(Globals.entrada):
		DialogueManager.show_dialogue_balloon(dialogue, "start")
	$MegCorp.monitoring=false
	if Globals.sellos==4:
		$MegCorp.monitoring=true


func _on_area_super_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Globals.entrada=false
		get_tree().change_scene_to_file("res://scenes/entrada_supermercado.tscn")
	

func _on_area_cole_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Globals.entrada=false
		get_tree().change_scene_to_file("res://scenes/colegioentrada.tscn")


func _on_area_ayuntamiento_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Globals.entrada=false
		get_tree().change_scene_to_file("res://scenes/AlcaldeAyuntamiento.tscn")


func _on_meg_corp_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Globals.entrada=false
		get_tree().change_scene_to_file("res://scenes/Empresafinal.tscn")


func _on_area_hospital_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Globals.entrada=false
		get_tree().change_scene_to_file("res://scenes/hospital.tscn")
