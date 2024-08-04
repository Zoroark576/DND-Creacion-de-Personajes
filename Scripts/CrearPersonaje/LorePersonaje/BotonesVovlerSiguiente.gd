extends botonesVolverSiguiente

@export var contenedorInputs : GridContainer
@export var opcionesClase : OptionButton
@export var opcionesRaza : OptionButton
@export var error : AcceptDialog
@export var nNombre : LineEdit

func _on_siguiente_pressed():
	if !nNombre.text.is_empty():
		for input in contenedorInputs.get_children():
			var valor
			if input.name == "Nombre":
				Personaje.nombre = input.text
			elif input is LineEdit or input is TextEdit:
				valor = input.text
				Personaje.lore[input.name] = valor
			elif input is SpinBox:
				valor = input.value
				Personaje.lore[input.name] = valor
			elif input is OptionButton:
				valor = input.get_item_text(input.get_selected_id())
				Personaje.lore[input.name] = valor
		var random = RandomNumberGenerator.new()
		var id = random.randi_range(100,999)
		if Personaje.id == 0:
			Personaje.id = id
		Personaje.nombreClase = opcionesClase.get_item_text(opcionesClase.get_selected_id())
		Personaje.nombreRaza = opcionesRaza.get_item_text(opcionesRaza.get_selected_id())
		super()
	else:
		error.visible = true
