extends botonesVolverSiguiente

@export var nNombre : LineEdit
@export var nTipo : OptionButton
@export var nFrecuencia : OptionButton
@export var nDescripcion : TextEdit
@export var popUp : AcceptDialog
var diccionario : Dictionary


func _on_siguiente_pressed():
	var tipoSeleccionado = nTipo.get_item_text(nTipo.get_selected_id())
	diccionario["Categoria"] = tipoSeleccionado
	diccionario["Frecuencia"] = nFrecuencia.text
	diccionario["Descripcion"] = nDescripcion.text
	match tipoSeleccionado:
		"Poder":
			guardarPoder()
		"Dote":
			guardarDoteRasgo(tipoSeleccionado)
		"Rasgo De Clase":
			guardarDoteRasgo(tipoSeleccionado)

@export var nPalabrasClave : TextEdit
@export var nImpacto : TextEdit
@export var nTipoPoder : OptionButton
func guardarPoder():
	diccionario["Palabras Clave"] = nPalabrasClave.text
	diccionario["Impacto"] = nImpacto.text
	diccionario["Tipo"] = nTipoPoder.get_item_text(nTipoPoder.get_selected_id())
	if Personaje.poderes.has(nNombre.text) or nNombre.text.is_empty():
		popUp.visible = true
	else:
		Personaje.poderes[nNombre.text] = diccionario
		super._on_siguiente_pressed()

@export var nCheckPermanente : CheckBox
@export var nCheckEfecto : CheckBox
@export var nOpcionEstad : OptionButton
@export var nValorEstad : SpinBox
@export var nOpcionEstad2 : OptionButton
@export var nValorEstad2 : SpinBox
func guardarDoteRasgo(tipo):
	diccionario["Permanente"] = nCheckPermanente.button_pressed
	var estaActivo = nCheckPermanente.button_pressed
	diccionario["Activo"] = estaActivo
	diccionario["Afecta"] = nCheckEfecto.button_pressed
	if nCheckEfecto.button_pressed:
		diccionario[nOpcionEstad.get_item_text(nOpcionEstad.get_selected_id())] = nValorEstad.value
		diccionario[nOpcionEstad2.get_item_text(nOpcionEstad2.get_selected_id())] = nValorEstad2.value
	if tipo == "Dote":
		if Personaje.dotes.has(nNombre.text) or nNombre.text.is_empty():
			popUp.visible = true
		else:
			Personaje.dotes[nNombre.text] = diccionario
			super._on_siguiente_pressed()
	elif tipo == "Rasgo De Clase":
		if Personaje.rasgosDeClase.has(nNombre.text) or nNombre.text.is_empty():
			popUp.visible = true
		else:
			Personaje.rasgosDeClase[nNombre.text] = diccionario
			super._on_siguiente_pressed()



