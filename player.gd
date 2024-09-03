extends CharacterBody2D

const MAX_HEALTH: int = 10

@onready var _health_label: Label = $HealthLabel
@onready var _coins_label: Label = $CoinsLabel

@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1000.0

@export var health: int = 10:
	get:
		return health
	set(new_value):
		health = clamp(new_value, 0, MAX_HEALTH)
		update_health_label()

@export var coins: int = 0:
	get:
		return coins
	set(new_value):
		coins = new_value
		update_coins_label()

func add_health_points(difference: int):
	health += difference

func add_coins(difference: int):
	coins += difference

func update_coins_label():
	if not is_instance_valid(_coins_label):
		return		
	_coins_label.text = 'C:' + str(coins)
	
func update_health_label():
	if not is_instance_valid(_health_label):
		return		
	_health_label.text = 'H:' + str(health) + "/" + str(MAX_HEALTH)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	if input_direction != Vector2.ZERO:
		#velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
		velocity = (velocity + (Vector2(input_direction) * acceleration * delta)).clampf(-max_speed, max_speed)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	
	move_and_slide()
