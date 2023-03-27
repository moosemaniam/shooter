extends Timer
var rock_scene = preload("res://scenes/Rock.tscn")
func spawn_asteriods():
	var asteriod_instance = rock_scene.instantiate()
	add_child(asteriod_instance)
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout",spawn_asteriods)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
