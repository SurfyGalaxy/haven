extends Label

func _process(delta: float) -> void:
	text = "In haven:\n" + str(State.havencheese)
