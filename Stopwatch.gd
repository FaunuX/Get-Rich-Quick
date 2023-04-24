extends Timer

var time = 0

func _ready():
	wait_time = 1.0

func get_time():
	return (1 - time_left) + time

func _on_timeout():
	time += 1
