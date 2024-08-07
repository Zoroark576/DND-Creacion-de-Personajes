extends "res://Scripts/CrearPersonaje/PoderesPersonaje/CrearPoderVolverSiguiente.gd"

@export var nEfectoActivo : CheckBox
var poder
@export var nNotificacionBorrarPoder : ConfirmationDialog

func _on_volver_pressed():
	super()
	poder["Activo"] = nEfectoActivo.button_pressed


func _on_borrar_poder_pressed():
	nNotificacionBorrarPoder.visible = true

func _on_borrar_poder_confirmed():
	match nTipo.get_item_text(nTipo.get_item_index(nTipo.get_selected_id())):
		"Poder":
			Personaje.poderes.erase(nNombre.text)
		"Dote":
			Personaje.dotes.erase(nNombre.text)
		"Rasgo De Clase":
			Personaje.rasgosDeClase.erase(nNombre.text)
	super._on_volver_pressed()
