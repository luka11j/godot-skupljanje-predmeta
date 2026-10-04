extends CharacterBody2D

@export var brzina: float = 500.0
@export var ubrzanje: float = 800.0
@export var trenje: float = 800.0


func _ready() -> void:
	position = Vector2(100, 250)
	velocity = Vector2.ZERO
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	add_to_group("igrac")


func _physics_process(delta: float) -> void:
	var smjer := Input.get_vector(
		"lijevo",
		"desno",
		"gore",
		"dolje"
	).normalized()

	if smjer != Vector2.ZERO:
		velocity = velocity.move_toward(
			smjer * brzina,
			ubrzanje * delta
		)
	else:
		velocity = velocity.move_toward(
			Vector2.ZERO,
			trenje * delta
		)

	move_and_slide()

	for i in range(get_slide_collision_count()):
		var sudar := get_slide_collision(i)

		if sudar.get_collider() is StaticBody2D:
			umri()
			break


func umri() -> void:
	print("Umro si!")
	get_tree().call_deferred("reload_current_scene")
