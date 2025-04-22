extends Control

func _ready():
	var sprite = $ColorRect/AnimatedSprite2D
	var screen_size = get_viewport_rect().size
	var texture = sprite.sprite_frames.get_frame_texture("default", 0)

	# Get the native size of the sprite frame
	var tex_size = texture.get_size()

	# Calculate scale to fill screen (optional: keep aspect ratio)
	var scale_x = screen_size.x / tex_size.x
	var scale_y = screen_size.y / tex_size.y
	sprite.scale = Vector2(scale_x, scale_y)

	# Center the sprite
	sprite.position = screen_size / 2
