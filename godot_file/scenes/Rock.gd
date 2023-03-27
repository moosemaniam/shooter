extends Node2D


const SPEED = 30.0
var angular_velocity = 0.0
var velocity = Vector2()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var screen_size
func _ready():
	screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x)
	var random_y = randf_range(0, screen_size.y)
	angular_velocity = randf_range(0,1.0)
	if randi() % 2 == 0:
		random_x = 0 if (random_x < screen_size.x / 2) else screen_size.x
	else:
		random_y = 0 if (random_y < screen_size.y / 2) else screen_size.y
	position = Vector2(random_x,random_y)
	rotation = randf_range(0,2*PI)
	var destination = Vector2(randf_range(0, screen_size.x),randf_range(0, screen_size.y))
	velocity = (destination - position ).normalized()
	velocity = velocity * SPEED
	print("Asteriod position",position)
	print("Asteriod velocity",velocity)
func _physics_process(delta):
	position += velocity * delta
	rotation += angular_velocity * delta
	if(position.x > screen_size.x || position.y > screen_size.y):
		queue_free()
		print("Clean up Asteriod")


func _on_bullet_body_entered(body: PhysicsBody2D) -> void:
		queue_free()
