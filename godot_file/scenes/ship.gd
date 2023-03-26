extends CharacterBody2D


var SPEED = 0
var screen_size # Size of the game window.
var direction
@export var rotation_speed_rad = 0.075

@export var velocity_damping_factor = 0.05 
var rotation_update = 0.0
var myvelocity = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	screen_size = get_viewport_rect().size
	SPEED = (screen_size.x + screen_size.y)/20.0
	direction = Vector2(0.0,-1.0)
	pass


func _physics_process(delta):
	myvelocity = (1-velocity_damping_factor) * myvelocity
	rotation_update =  0.0 

	if Input.is_action_pressed("ui_forward"):
		print("FORWARD")
		myvelocity.x += SPEED * cos(direction.angle())
		myvelocity.y += SPEED * sin(direction.angle())
		print("Velocity",myvelocity)
		print("Angle",(PI/180.0)*myvelocity.angle())
	if Input.is_action_pressed("ui_rot_clock_wise"):
		print("ROTATE CLOCKWISE")
		direction = direction.rotated(rotation_speed_rad)
		rotation_update = rotation_speed_rad
	if Input.is_action_pressed("ui_rot_counter_clock_wise"):
		print("ROTATE Counter clockwise")
		direction = direction.rotated(-rotation_speed_rad)
		rotation_update = -rotation_speed_rad
	rotation = (rotation + rotation_update)
	position += myvelocity * delta
	if(position.x > screen_size.x ):
		position.x = 0
	if(position.x < 0 ):
		position.x = screen_size.x
	if(position.y > screen_size.y ):
		position.y = 0
	if(position.y < 0):
		position.y = screen_size.y
	
