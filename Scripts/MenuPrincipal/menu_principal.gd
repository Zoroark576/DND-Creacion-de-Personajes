extends Control
var crearLore = preload("res://Escenas/CrearPersonaje/LorPersonaje.tscn")

func _ready():
	Personaje.resetearValores()

func _on_crear_personaje_pressed():
	get_tree().change_scene_to_packed(crearLore)
	
