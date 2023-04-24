extends Node

var coins = 0
var total_coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stopwatch.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _collect_coin(body, node):
	if body == $Player:
		coins += 1
		$CanvasLayer/GUI/Label.text = str(coins)
		$Level.call_deferred("remove_child", node)
		if coins == total_coins:
			$CanvasLayer/GUI/Label.text = str($Stopwatch.get_time())


func _on_level_child_entered_tree(node):
	if node.get_class() == "Area2D":
		total_coins += 1
		node.connect("body_entered", self._collect_coin.bind(node))
