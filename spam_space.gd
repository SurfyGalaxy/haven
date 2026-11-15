extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		add_theme_font_size_override("font_size",70)
		pass
	add_theme_font_size_override("font_size",get_theme_font_size("font_size")*0.75+50*0.25)
	pass


func _on_timer_timeout() -> void:
	hide()
	pass # Replace with function body.
