extends "res://Scripts/CrearPersonaje/PoderesPersonaje/CrearPoderVolverSiguiente.gd"

@export var nEfectoActivo : CheckBox
var poder

func _on_volver_pressed():
	super()
	poder["Activo"] = nEfectoActivo.button_pressed
