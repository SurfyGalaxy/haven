extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "bounce: " + str(State.squishiness) + "x cost: " + str(int(-50 + State.squishiness*100))
	if State.cheese >= (-50 + State.squishiness*100):
		add_theme_color_override("font_hover_color",Color(0,255,0))
		add_theme_color_override("font_pressed_color",Color(0,255,0))
	else:
		add_theme_color_override("font_hover_color",Color(255,0,0))
		add_theme_color_override("font_pressed_color",Color(255,0,0))
		pass
	pass

func _pressed() -> void:
	if State.cheese >= (-50 + State.squishiness*100):
		State.cheese += -(-50 + State.squishiness*100)
		State.squishiness += 0.2
		State.cheese = round(State.cheese)
		State.squishiness = round((State.squishiness)*10)/10
	pass
pass
