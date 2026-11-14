extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	State.cheese = int(State.cheese)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: #cheater...
	text = "Cheese: "+str(State.cheese)
	if Input.is_key_pressed(KEY_0):
		State.cheese += 50*State.earnings
	pass
