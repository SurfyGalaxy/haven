extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tax_evasion_pressed() -> void:
	text = "Kevin is watching"
	add_theme_color_override("font_color",Color(255,0,0))
	add_theme_font_size_override("font_size",20)
	
	pass # Replace with function body.
