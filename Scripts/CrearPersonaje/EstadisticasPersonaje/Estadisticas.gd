extends PanelContainer

@export var contEstadisticasRaciales : VBoxContainer
@export var contInputs : GridContainer
@export var recursoRaza : Raza

var limiteCualquiera
var limiteActual
var valorAnterior = 0
var diccionarioStats 

func _ready():
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	diccionarioStats = recursoRaza.puntuacionesDeCaracteristica
	revisarOpciones(diccionarioStats.keys())
	if !diccionarioStats.has("ANY"):
		for contador : SpinBox in contEstadisticasRaciales.get_children():
			if diccionarioStats.has(contador.name):
				contador.value = diccionarioStats.get(contador.name)
	else:
		limiteCualquiera = diccionarioStats.get("ANY")
		limiteActual = limiteCualquiera
		for contador : SpinBox in contEstadisticasRaciales.get_children():
			contador.editable = true
			contador.max_value = diccionarioStats.get("ANY")
			contador.step = contador.max_value
			contador.value_changed.connect(valorCambiadoBonus)

func valorCambiadoBonus(valor):
	for contador : SpinBox in contEstadisticasRaciales.get_children():
		if contador.editable == true:
			limiteActual -= contador.value
	if limiteActual <= 0:
		for contador : SpinBox in contEstadisticasRaciales.get_children():
			contador.max_value = contador.value
	elif limiteActual > 0:
		for contador : SpinBox in contEstadisticasRaciales.get_children():
			contador.max_value = limiteCualquiera
	limiteActual = limiteCualquiera

func _on_aleatorio_pressed():
	var rng = RandomNumberGenerator.new()
	for input in contInputs.get_children():
		if input is SpinBox:
			input.value = rng.randi_range(input.min_value,input.max_value)

func revisarOpciones(llavesDiccionario):
	var opciones
	for llave : String in llavesDiccionario:
		if llave.contains("/"):
			opciones = llave.split("/")
			limiteCualquiera = diccionarioStats.get(llave)
			limiteActual = limiteCualquiera
			for contador : SpinBox in contEstadisticasRaciales.get_children():
				for opcion in opciones:
					if contador.name == opcion:
						contador.editable = true
						contador.value = 0
						contador.max_value = diccionarioStats.get(llave)
						contador.step = contador.max_value
						contador.value_changed.connect(valorCambiadoBonus)
