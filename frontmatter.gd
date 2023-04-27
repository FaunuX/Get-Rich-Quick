extends Node2D

@export var shader_in_canvas_layer: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer.contains_shader = shader_in_canvas_layer
	$CanvasLayer.add_shader()


func move_bg():
	$ParallaxBackground.scroll_offset.x -= 2
	$ParallaxBackground.scroll_offset.y -= 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
