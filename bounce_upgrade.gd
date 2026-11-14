extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "bounce: " + str(State.earnings) + " cost: " + str(40 + 10*State.earnings**2.5)
	if State.cheese > (40 + 10*State.earnings**2.5):
		add_theme_color_override("font_hover_color",Color(0,255,0))
		add_theme_color_override("font_pressed_color",Color(0,255,0))
	else:
		add_theme_color_override("font_hover_color",Color(255,0,0))
		add_theme_color_override("font_pressed_color",Color(255,0,0))
		pass
	pass

func _pressed() -> void:
	if State.cheese > (40 + 10*State.earnings**2.5):
		State.cheese += -(40 + 10*State.earnings**2.5)
		State.earnings += 1
	pass
pass
