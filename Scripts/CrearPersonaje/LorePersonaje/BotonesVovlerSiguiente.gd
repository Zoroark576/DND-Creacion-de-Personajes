extends botonesVolverSiguiente

@export var contenedorInputs : GridContainer
@export var opcionesClase : OptionButton
@export var opcionesRaza : OptionButton

func _on_siguiente_pressed():
	super()
	for input in contenedorInputs.get_children():
		var valor
		if input is LineEdit or input is TextEdit:
			valor = input.text
			Personaje.lore[input.name] = valor
		elif input is SpinBox:
			valor = input.value
			Personaje.lore[input.name] = valor
		elif input is OptionButton:
			valor = input.get_item_text(input.get_selected_id())
			Personaje.lore[input.name] = valor
		
	Personaje.nombreClase = opcionesClase.get_item_text(opcionesClase.get_selected_id())
	Personaje.nombreRaza = opcionesRaza.get_item_text(opcionesRaza.get_selected_id())
