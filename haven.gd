extends Button



func _on_pressed() -> void:
	var input = $"../LineEdit".text
	var a = RegEx.new()
	a.compile("([+-]?(?=.\\d|\\d)(?:\\d+)?(?:\\.?\\d*))(?:[Ee]([+-]?\\d+))?")
	if a.search(input):
		input = int(input)
		if input >= 0: # Inputting cheese
			if State.cheese >= input:
				State.cheese -= input
				State.havencheese += input
			else:
				$"../Error".text = "You're too broke!"
		else:
			if State.havencheese >= -input:
				State.havencheese += input
				State.cheese -= input
			else:
				$"../Error".text = "Not enough in the haven"
	else:
		$"../Error".text = "Invalid input"
	$"../LineEdit".text = ""
