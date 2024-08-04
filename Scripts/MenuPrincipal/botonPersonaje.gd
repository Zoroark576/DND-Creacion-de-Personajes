extends Control
@export var nNombre : Button
var nombreArchivo
var nombre
var recursoGuardarCargar = preload("res://Recursos/guardarCargarPersonaje.tres")
var menuPersonaje = load("res://Escenas/MenuPersonaje/MenuPersonaje.tscn")
@export var confirmacion : ConfirmationDialog

signal personajeEliminado

func crearBoton(nombreSet : String):
	nombreArchivo = nombreSet
	nombre = nombreSet.trim_suffix(".ini")
	nombre = nombre.left(nombre.length()-4)
	nNombre.text = nombre

func _on_personaje_pressed():
	if recursoGuardarCargar.cargarPersonaje(nombreArchivo) == "OK":
		get_tree().change_scene_to_packed(menuPersonaje)

func _on_borrar_pressed():
	confirmacion.visible = true
	confirmacion.dialog_text += nombre + "?"


func _on_confirmation_dialog_confirmed():
	recursoGuardarCargar.eliminarPersonaje(nombreArchivo)
	personajeEliminado.emit()
