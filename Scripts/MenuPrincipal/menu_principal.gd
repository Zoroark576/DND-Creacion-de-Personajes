extends Control
var crearLore = preload("res://Escenas/CrearPersonaje/LorPersonaje.tscn")
var recursoGuardarCargar = preload("res://Recursos/guardarCargarPersonaje.tres")
var botonPersonaje = preload("res://Escenas/MenuPrincipal/botonPersonaje.tscn")
@export var listaPersonajes : VBoxContainer

func _ready():
	Personaje.resetearValores()
	cargarPersonajes()

func _on_crear_personaje_pressed():
	get_tree().change_scene_to_packed(crearLore)

func cargarPersonajes():
	for personaje in listaPersonajes.get_children():
		listaPersonajes.remove_child(personaje)
		personaje.queue_free()
	var listaArchivos = recursoGuardarCargar.cargarListaDePersonajes()
	for archivo in listaArchivos:
		var nuevoBoton = botonPersonaje.instantiate()
		nuevoBoton.crearBoton(archivo)
		nuevoBoton.personajeEliminado.connect(cargarPersonajes)
		listaPersonajes.add_child(nuevoBoton)


