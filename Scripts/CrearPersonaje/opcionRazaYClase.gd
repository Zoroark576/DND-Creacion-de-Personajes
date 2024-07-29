extends HBoxContainer

@export var tipoOpcion : String
@export var botonOpcion : OptionButton
var recursoRaza = preload("res://Recursos/Razas/Raza.tres")
var recursoClase = preload("res://Recursos/Clases/Clase.tres")
var recursoSeleccionado

func _ready():
	match tipoOpcion:
		"raza":
			recursoSeleccionado = recursoRaza
			recursoSeleccionado._read_json()
			razaSeleccionada()
		"clase":
			recursoSeleccionado = recursoClase
			recursoSeleccionado._read_json()
			claseSeleccionada()

func razaSeleccionada():
	for indice in (recursoSeleccionado.diccionarioRazas.size() + recursoSeleccionado.diccionarioRazas2.size()):
		var raza = recursoSeleccionado
		raza.iterarRazas(indice)
		botonOpcion.add_item(raza.nombre)
	botonOpcion.select(0)

func claseSeleccionada():
	for indice in recursoSeleccionado.diccionarioClases.size():
		var clase = recursoSeleccionado
		clase.iterarClases(indice)
		botonOpcion.add_item(clase.nombre)
	botonOpcion.select(0)

func _on_boton_mas_pressed():
	pass # Replace with function body.
