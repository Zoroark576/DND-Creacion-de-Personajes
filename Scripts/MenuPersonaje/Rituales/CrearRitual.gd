extends Control

@export var nTitulo : LineEdit
@export var nNivel : SpinBox
@export var nTiempo : LineEdit
@export var nCoste : LineEdit
@export var nHabilidadClave : LineEdit
@export var nTextoFlorido : TextEdit
@export var nContenido : TextEdit
@export var nDominado : CheckBox
@export var nAccept : AcceptDialog

var eMenuRituales = load("res://Escenas/MenuPersonaje/Rituales/Rituales.tscn")



func _on_button_pressed():
	var titulo = nTitulo.text
	var diccionarioRitual = {}
	diccionarioRitual["Nivel"] = str(nNivel.value)
	diccionarioRitual["Tiempo"] = nTiempo.text
	diccionarioRitual["Costo"] = nCoste.text
	diccionarioRitual["Habilidad Clave"] = nHabilidadClave.text
	diccionarioRitual["Texto Florido"] = nTextoFlorido.text
	diccionarioRitual["Dominado"] = nDominado.button_pressed
	diccionarioRitual["Contenido"] = nContenido.text
	
	if titulo.is_empty() or Personaje.rituales.has(titulo):
		nAccept.visible = true
	else:
		Personaje.rituales[titulo] = diccionarioRitual
		get_tree().change_scene_to_packed(eMenuRituales)
