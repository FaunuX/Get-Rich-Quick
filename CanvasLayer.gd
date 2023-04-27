extends CanvasLayer

@export var contains_shader: bool = false
var VShader = preload("res://VignetteShader.tscn").instantiate()


func _ready():
	pass

func add_shader():
	if contains_shader:
		add_child(VShader)
	else:
		add_sibling(VShader)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
