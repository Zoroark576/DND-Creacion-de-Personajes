extends PanelContainer

@export var contEstadisticasRaciales : VBoxContainer
@export var contInputs : GridContainer
@export var recursoRaza : Raza

func _ready():
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	var diccionarioStats = recursoRaza.puntuacionesDeCaracteristica
	for contador : SpinBox in contEstadisticasRaciales.get_children():
		if diccionarioStats.has(contador.name):
			contador.value = diccionarioStats.get(contador.name)


func _on_aleatorio_pressed():
	var rng = RandomNumberGenerator.new()
	for input in contInputs.get_children():
		if input is SpinBox:
			input.value = rng.randi_range(input.min_value,input.max_value)
