extends Control
var crearLore = preload("res://Escenas/CrearPersonaje/LorePersonaje.tscn")

func _ready():
	pass

func _on_crear_personaje_pressed():
	get_tree().change_scene_to_packed(crearLore)
	
