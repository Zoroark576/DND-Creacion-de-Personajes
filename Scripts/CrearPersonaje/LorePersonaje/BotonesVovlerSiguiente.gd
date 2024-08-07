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
		aplicarDotesYRasgos()
		super()
	else:
		error.visible = true

var recursoClase : Clase = load("res://Recursos/Clases/Clase.tres")
var recursoRaza : Raza = load("res://Recursos/Razas/Raza.tres")
func aplicarDotesYRasgos():
	recursoClase._read_json()
	recursoRaza._read_json()
	recursoClase.obtenerClase(Personaje.nombreClase)
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	
	for dote in recursoRaza.habilidades:
		var diccionarioDote : Dictionary = {}
		diccionarioDote["Nombre"] = dote
		diccionarioDote["Categoria"] = "Dote"
		diccionarioDote["Frecuencia"] = "Voluntad"
		diccionarioDote["Descripcion"] = str(recursoRaza.habilidades.get(dote))
		if diccionarioDote["Descripcion"].contains("#"):
			diccionarioDote["Permanente"] = false
		else:
			diccionarioDote["Permanente"] = true
		diccionarioDote["Afecta"] = diccionarioDote["Permanente"]
		diccionarioDote["Activo"] = diccionarioDote["Permanente"]
		diccionarioDote["Inicial"] = true
		for bonificador in recursoRaza.otrosBonificadoresDeHabilidad:
			diccionarioDote[bonificador] = recursoRaza.otrosBonificadoresDeHabilidad.get(bonificador)
		Personaje.dotes[dote] = diccionarioDote
	for rasgo in recursoClase.rasgos:
		var diccionarioRasgo : Dictionary = {}
		diccionarioRasgo["Nombre"] = rasgo
		diccionarioRasgo["Categoria"] = "Rasgo De Clase"
		diccionarioRasgo["Frecuencia"] = "Voluntad"
		diccionarioRasgo["Descripcion"] = str(recursoClase.rasgos.get(rasgo))
		if diccionarioRasgo["Descripcion"].contains("#"):
			diccionarioRasgo["Permanente"] = false
		else:
			diccionarioRasgo["Permanente"] = true
		diccionarioRasgo["Afecta"] = diccionarioRasgo["Permanente"]
		diccionarioRasgo["Activo"] = diccionarioRasgo["Permanente"]
		diccionarioRasgo["Inicial"] = true
		Personaje.rasgosDeClase[rasgo] = diccionarioRasgo
