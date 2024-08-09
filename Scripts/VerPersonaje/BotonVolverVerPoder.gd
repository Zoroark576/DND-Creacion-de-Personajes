extends "res://Scripts/CrearPersonaje/PoderesPersonaje/CrearPoderVolverSiguiente.gd"

@export var nEfectoActivo : CheckBox
var poder
@export var nNotificacionBorrarPoder : ConfirmationDialog
@export var nNota : TextEdit
@export var nNombreEfecto1 : OptionButton
@export var nNombreEfecto2 : OptionButton
@export var nValorEfecto1 : SpinBox
@export var nValorEfecto2 : SpinBox
@export var nAfecta : CheckBox
signal eliminarEscena

func _ready():
	print(get_parent())

func _on_volver_pressed():
	for index in nNombreEfecto1.item_count:
		if poder.has(nNombreEfecto1.get_item_text(index)):
			poder.erase(nNombreEfecto1.get_item_text(index))
	poder[nNombreEfecto1.get_item_text(nNombreEfecto1.get_item_index(nNombreEfecto1.get_selected_id()))] = nValorEfecto1.value
	if nNombreEfecto2.get_selected_id() != 0:
		poder[nNombreEfecto2.get_item_text(nNombreEfecto2.get_item_index(nNombreEfecto2.get_selected_id()))] = nValorEfecto2.value
	poder["Afecta"] = nAfecta.button_pressed
	poder["Activo"] = nEfectoActivo.button_pressed
	poder["Nota"] = nNota.text
	super()
	eliminarEscena.emit()
	


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
