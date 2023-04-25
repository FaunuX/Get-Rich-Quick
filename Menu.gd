extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 2
	$ParallaxBackground.scroll_offset.y -= 2


func _on_button_button_down():
	get_tree().change_scene_to_file("res://Main.tscn")
