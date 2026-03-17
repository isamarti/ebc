extends CharacterBody2D

@export var speed = 300.0
@onready var animation_tree: AnimationTree = $AnimationTree

var direction: Vector2

func _ready() -> void:
	animation_tree.active=true

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	update_animation_parameters()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:

	direction = Input.get_vector("left","right","up","down").normalized()

	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func update_animation_parameters():

	if direction == Vector2.ZERO:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_walking"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_walking"] = true

	if direction != Vector2.ZERO:
		print(direction)
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/walk/blend_position"] = direction
