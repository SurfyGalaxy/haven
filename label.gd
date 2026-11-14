extends Label

var test_32 = 0
var go = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if go:
		test_32 += 2
		text = str(test_32)
	pass


func _on_start_button_pressed() -> void:
	go = 1
	show()
	pass # Replace with function body.
