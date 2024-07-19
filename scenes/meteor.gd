extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

const GRAPHIC_ARRAY = [
	"meteorBrown_big1.png", 
	"meteorBrown_big2.png", 
	"meteorBrown_big3.png", 
	"meteorBrown_big4.png", 
	#"meteorBrown_med1.png", 
	#"meteorBrown_med3.png", 
	#"meteorBrown_small1.png", 
	#"meteorBrown_small2.png", 
	#"meteorBrown_tiny1.png", 
	#"meteorBrown_tiny2.png", 
	"meteorGrey_big1.png", 
	"meteorGrey_big2.png", 
	"meteorGrey_big3.png", 
	"meteorGrey_big4.png"
	#, 
	#"meteorGrey_med1.png", 
	#"meteorGrey_med2.png", 
	#"meteorGrey_small1.png", 
	#"meteorGrey_small2.png", 
	#"meteorGrey_tiny1.png", 
	#"meteorGrey_tiny2.png"	
]

func _ready():
	var rng := RandomNumberGenerator.new()
	
	var graphic_size = GRAPHIC_ARRAY.size() - 1
	var path: String = "res://assets/PNG/Meteors/" + GRAPHIC_ARRAY[rng.randi_range(0, graphic_size)]
	
	$Sprite2D.texture = load(path)
	
	var width = get_viewport_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body):
	pass
