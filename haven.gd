extends Button

var random = RandomNumberGenerator.new()

func _on_pressed() -> void:
	$"../Error".text = ""
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
				if random.randf() < 0.1:
					$"../Error".text = "The cheese got lost in transit (or they scammed you)"
				else:
					State.cheese -= input
			else:
				$"../Error".text = "Not enough in the haven"
	else:
		$"../Error".text = "Invalid input"
	$"../LineEdit".text = ""
