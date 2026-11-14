extends Sprite2D

var timeout = false
var ascending = false
var speed = 10000
var height = 0
var distance_done = 0 
var flyspeed = 0

const screensize = 648
const startheight = 200
const spritesize = 1376
const x_pos = 566
const start_sky_colour = Color("4a84ff")

const skycolourchangefactor = 0.001
const catchrate = 100

@export
var burstspeed = 1.1

@export
var squishiness = 1 # Multiplier    
@export
var gravity = 1

func _on_timer_timeout() -> void:
	timeout = true
	height = speed * State.squishiness
	flyspeed = height

func _input(event: InputEvent) -> void:
	if not timeout and event.is_action_pressed("space"):
		speed += 1  

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

			print("A") 
			print(position.y)
			if position.y - speed <= 200 and speed > 0:
				speed = float(speed) / burstspeed
			if position.y < 200 and speed <= 1:
				var deviation = 200 - position.y
				position.y += abs(deviation) / catchrate
			position.y -= speed
			doneheight + 1
			var screen = $"../Background"
			print(screen.color.r)
			if screen.color.r > 0:
				screen.color.r -= 1 * skycolourchangefactor
			if screen.color.b > 0:
				screen.color.b -= 1 * skycolourchangefactor
			if screen.color.g > 0:
				screen.color.g -= 1 * skycolourchangefactor
			if snapped(position.y, 10) == 200:
				if flag:
					gayming = false
					print("DOEN")
				else:
					flag = true
			else:
				flag = false
			  
		elif not ascending:
			position.y += speed 
			print(position.y)
			if position.y > screensize:
				ascending = true
		
		#if ascending:
			#if height >= distance_done:
				#distance_done += 1
			#if position.y >= 200:
				#var temp = Vector2(x_pos, position.y - (448/(60 /(1 * float(speed)))))
				#if temp.y + position.y > 200:
					#position.y = 200
				#else:
					#position.y += temp.y
				#colourheight = distance_done / 100
				#print(distance_done)
		#
		#elif tick < (screensize - startheight):
			#tick += 448/60
			#print(process_curve(flyspeed, tick))
			#position = Vector2(x_pos, position.y + (448/60.0) )
		#
		#
		#elif not ascending:
			#ascending = true                                       
		#print(str(flyspeed) + "speed, tick: " + str(tick))
#
#func process_curve(target:float, x:float) -> float:
	#return (target / (screensize - startheight) ** 2.23) * x ** 2.23
