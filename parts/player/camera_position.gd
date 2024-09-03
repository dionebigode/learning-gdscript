extends Node2D

@export var camera_distance: float = 200
@export var position_interpolation_speed: float = 1.0

@onready var _player: CharacterBody2D = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = move_direction * camera_distance
	
	position = position.lerp(target_position, position_interpolation_speed * delta)
