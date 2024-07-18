extends OptionButton

@export var tipoOpcion : String
var recursoRaza = preload("res://Recursos/Razas/Raza.tres")
var recursoClase
var recursoSeleccionado

func _ready():
	match tipoOpcion:
		"raza":
			recursoSeleccionado = recursoRaza
			recursoSeleccionado.read_json()
			razaSeleccionada()
		"clase":
			recursoSeleccionado = recursoClase

func razaSeleccionada():
	for indice in recursoSeleccionado.diccionarioRazas.size():
		var raza = recursoSeleccionado
		raza.iterarRazas(indice)
		add_item(raza.nombre)




