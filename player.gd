extends Sprite2D

var timeout = false
var speed = 0

@export
var squishiness = 1 # Percent the character squishes on contact

func _on_timer_timeout() -> void:
	timeout = true
	print(speed)
	

func _input(event: InputEvent) -> void:
	if not timeout and event.is_action_pressed("space"):
		speed += 1

func _physics_process(delta: float) -> void:
	pass
	
