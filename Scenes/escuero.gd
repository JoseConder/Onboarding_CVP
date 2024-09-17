extends Node2D

var speed = 0
var turtle_size = 100
var camera_node: Camera2D = null

func _ready() -> void:
	camera_node = get_tree().root.get_node("Main/Node2D/Camera2D")
	if not camera_node:
		print("Camera2D not found")



func change_speed():
	speed =- randf_range(100, 600)

signal enemy_out_of_screen

func _process(delta: float) -> void:
	change_speed()
	global_position.x += speed*delta
	if camera_node:
		var screen_left_edge = camera_node.position.x - get_viewport().size.x / 2
		var screen_right_edge = camera_node.position.x + get_viewport().size.x / 2
		if global_position.x + (turtle_size * 2.5) < screen_left_edge:
			print("saliendo de pantalla")
			emit_signal("enemy_out_of_screen")
			queue_free()
	


	
