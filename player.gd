extends Sprite2D

var timeout = false
var ascending = false
var speed = 0
var height = 0
var distance_done = 0 
var flyspeed = 0

const screensize = 648
const startheight = 200
const x_pos = 566
const start_sky_colour = Color("4a84ff")

@export
var squishiness = 1 # Multiplier    
@export
var gravity = 1

func _on_timer_timeout() -> void:
	timeout = true
	print(speed)
	height = speed * State.squishiness
	flyspeed = height
	print(flyspeed)

func _input(event: InputEvent) -> void:
	if not timeout and event.is_action_pressed("space"):
		speed += 1

var tick = 0
var colourheight = 0
func _process(_delta: float) -> void:
	if timeout:
		if ascending:
			if height < 0:
				distance_done += 1
				height -= 1
			if position.y >= 200:
				var temp = Vector2(x_pos, position.y - (448/(60 /(1 * float(speed)))))
				if temp.y + position.y > 200:
					position.y = 200
				else:
					position.y += temp.y                                          
			else:
				colourheight = distance_done / 100
				print(distance_done)
		
		elif tick < (screensize - startheight):
			tick += 448/60
			print(process_curve(flyspeed, tick))
			position = Vector2(x_pos, position.y + (448/60.0) )
		
		
		elif not ascending:
			ascending = true                                       
		print(str(flyspeed) + "speed, tick: " + str(tick))

func process_curve(target:float, x:float) -> float:
	return (target / (screensize - startheight) ** 2.23) * x ** 2.23
