extends CharacterBody2D

const SPEED = 180

@onready var anim = $AnimatedSprite2D  # Update this path if needed

var last_direction = Vector2.DOWN  # Default facing front

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	# Save last movement direction for idle facing
	if input_vector != Vector2.ZERO:
		last_direction = input_vector
		velocity = input_vector * SPEED
		move_and_slide()
		update_animation(input_vector)
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		update_idle_animation()


func update_animation(direction: Vector2):
	if direction.x != 0:
		# Left or Right movement
		anim.animation = "walk_side"
		anim.flip_h = direction.x < 0
	elif direction.y < 0:
		anim.animation = "walk_back"
	else:
		anim.animation = "walk_front"
	anim.play()

func update_idle_animation():
	if last_direction.x != 0:
		anim.animation = "idle_side"
		anim.flip_h = last_direction.x < 0
	elif last_direction.y < 0:
		anim.animation = "idle_back"
	else:
		anim.animation = "default"
	anim.play()
