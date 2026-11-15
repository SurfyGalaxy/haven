extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if State.cheese <= 0:
		disabled = true
		pass
	State.taxevasion = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	State.taxevasion = true
	text = "good luck."
	add_theme_color_override("font_color",Color(255,0,0))
	add_theme_color_override("font_hover_color",Color(255,0,0))
	add_theme_color_override("font_hover_pressed_color",Color(255,0,0))
	add_theme_color_override("font_pressed_color",Color(255,0,0))
	pass
