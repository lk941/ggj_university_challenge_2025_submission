extends AnimatedSprite2D

func _ready():
	await get_tree().create_timer(0.1).timeout

	self.play("default")

	
	
