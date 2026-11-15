extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if State.cheese <= 0:
		hide()
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tax_evasion_pressed() -> void:
	if State.Kevinchance <= 0.05:
		text = "Kevin is watching"
	elif State.Kevinchance <= 0.1:
		text = "Kevin has noticed you gaining more cheese than usual"
	elif State.Kevinchance <= 0.15:
		text = "Kevin is looking closer at your account"
	elif State.Kevinchance <= 0.25:
		text = "Kevin is keeping a close eye at you"
	elif State.Kevinchance <= 0.4:
		text = "Kevin knows"
	else:
		text = "Kevin is coming to you"
	
	
	
	add_theme_color_override("font_color",Color(255,0,0))
	add_theme_font_size_override("font_size",20)
	
	pass # Replace with function body.
