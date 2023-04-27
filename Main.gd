extends Node

var coins = 0
var total_coins = 0
var won = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stopwatch.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !won:
		$CanvasLayer/GUI/GridContainer/Time.text = str(round($Stopwatch.get_time()))

func win():
	won = true
	$CanvasLayer/GUI/GridContainer/RichTextLabel.text = ""
	$CanvasLayer/GUI/GridContainer/Time.text = ""
	$CanvasLayer/GUI/VBoxContainer/RichTextLabel.text = str($Stopwatch.get_time())
	print($CanvasLayer/GUI/VBoxContainer/RichTextLabel.text)
	$CanvasLayer/GUI/VBoxContainer/RichTextLabel2.visible = true
	$CanvasLayer/GUI/VBoxContainer/Button.visible = true

func _collect_coin(body, node):
	if body == $Player:
		coins += 1
		$CanvasLayer/GUI/GridContainer/RichTextLabel.text = str(coins)
		$Level.call_deferred("remove_child", node)
		if coins == total_coins:
			win()


func _on_level_child_entered_tree(node):
	if node.get_class() == "Area2D":
		total_coins += 1
		node.connect("body_entered", self._collect_coin.bind(node))


func _on_gui_restart():
	get_tree().reload_current_scene()
