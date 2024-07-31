extends Control
var menuCrear = preload("res://Escenas/CrearPoder/CrearPoder.tscn")

func _on_crear_pressed():
	get_tree().change_scene_to_packed(menuCrear)
