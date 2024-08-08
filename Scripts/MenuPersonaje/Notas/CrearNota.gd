extends Control

@export var nTitulo : LineEdit
@export var nFecha : LineEdit
@export var nContenido : TextEdit
@export var nAccept : AcceptDialog
var eMenuNotas = load("res://Escenas/MenuPersonaje/Notas/Notas.tscn")

func _on_guardar_nota_pressed():
	var titulo = nTitulo.text
	var fecha = nFecha.text
	var contenido = nContenido.text
	
	var diccionarioNota = {}
	diccionarioNota["Fecha"] = fecha
	diccionarioNota["Contenido"] = contenido
	
	if Personaje.notas.has(titulo) or titulo.is_empty():
		nAccept.visible = true
	else:
		Personaje.notas[titulo] = diccionarioNota
		get_tree().change_scene_to_packed(eMenuNotas)
	
