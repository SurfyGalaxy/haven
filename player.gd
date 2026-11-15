extends Sprite2D

var timeout = false
var ascending = false
var speed = 1
var height = 0
var distance_done = 0 
var flyspeed = 0
var homeable = false

const screensize = 500
const startheight = 200
const spritesize = 1376
const x_pos = 566
const start_sky_colour = Color("4a84ff")

const skycolourchangefactor = 0.001111
const catchrate = 100

@export
var burstspeed = 1.1    

var squishiness = State.squishiness

@export
var gravity = 1

func _ready() -> void:
	$"end label".modulate.a = 0

func _on_timer_timeout() -> void:
	timeout = true
	height = speed * State.squishiness
	flyspeed = height

func _input(event: InputEvent) -> void:
	if not timeout and event.is_action_pressed("space"):
		speed += 1 
	elif homeable and event.is_action_pressed("space"):
		State.taxevasion = false    
		State.havencheese = round(State.havencheese * 1.1)
		get_tree().change_scene_to_file("res://control.tscn")

var tick = 0
var colourheight = 0
var burst = true
var hold = true
var doneheight = 0
var gayming = true
var flag = false

func _process(_delta: float) -> void:
	if timeout:
		if ascending and gayming:
			var deviation = 200 - position.y
			$"../Floor".position.y += abs(deviation) / (catchrate / 2) 
			if position.y - speed <= 200 and speed > 0:
				speed = float(speed) / burstspeed
			if position.y < 200 and speed <= 1:
				position.y += abs(deviation) / catchrate
			position.y -= speed
			doneheight + 1
			var screen = $"../Background"
			if screen.color.r > 0:
				screen.color.r -= 1 * skycolourchangefactor
			if screen.color.b > 0:
				screen.color.b -= 1 * skycolourchangefactor
			if screen.color.g > 0:
				screen.color.g -= 1 * skycolourchangefactor
			if snapped(position.y, 10) == 200:
				if flag:
					gayming = false
				else:
					flag = true
			else:
				flag = false
		elif not ascending:
			position.y += speed
			if position.y > screensize:
				ascending = true
		elif not gayming:
			end_animation()           

var first = true
var caught = RandomNumberGenerator.new().randf() < State.Kevinchance
var cheese_gain
func end_animation():
	if first:
		if State.taxevasion:
			if caught:
				cheese_gain = -(round(height * State.earnings)) * 1.5
			else:
				cheese_gain = round(height * State.earnings)
				if State.Kevinchance < 0.95:
					State.Kevinchance += 0.06                       
			State.taxevasion = true
		else:
			cheese_gain = round(height * State.earnings) * 0.75
		if State.Kevinchance > 0.05:
			State.Kevinchance -= 0.01
		first = false                                                               
		State.cheese += cheese_gain
	if State.taxevasion:
		if cheese_gain >= 0:
			$"end label".text = "Daven flew " + str(height) + " metres!\nYou got away with tax evasion, gaining " + str(cheese_gain) + " cheese slices!\n\n\n\n\nPress space again to return to the menu"
		else:
			$"end label".text = "Daven flew " + str(height) + " metres!\nYou got caught evading tax by Kevin, paying " + str(cheese_gain) + " cheese slices in fines.\n\n\n\n\nPress space again to return to the menu"
	else:
		$"end label".text = "Daven flew " + str(height) + " metres!\nYou gained " + str(cheese_gain) + " cheese slices!\n\n\n\n\nPress space again to return to the menu"  
	homeable = true
	get_tree().create_tween().tween_property($"end label", "modulate:a", 1, 1.0)
