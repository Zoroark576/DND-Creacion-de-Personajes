extends "res://Scripts/CrearPersonaje/PoderesPersonaje/CrearPoder.gd"

@export_group("Ver Poder")
@export var nNombre : LineEdit
@export var nTipo : OptionButton
@export var nFrecuencia : OptionButton
@export var nDescripcion : TextEdit
@export_subgroup("Poder")
@export var nFuncionalidad : TextEdit
@export var nImpacto : TextEdit
@export var nUtilidad : OptionButton
@export_subgroup("Dote O Rasgo")
@export var nAfectaEstadistica : CheckBox
@export var nEfectoPermanente : CheckBox
@export var nNombreEfecto1 : OptionButton
@export var nValorEfecto1 : SpinBox
@export var nNombreEfecto2 : OptionButton
@export var nValorEfecto2 : SpinBox
@export var nEfectoActivo : CheckBox

@export var botonVolver : HBoxContainer

var poder


func asignarVolver(ruta):
	if ruta != null:
		botonVolver.rutaVolver = ruta

func _ready():
	botonVolver.poder = poder
	nAfectaEstadistica.disabled = true
	nEfectoPermanente.disabled = true
	nNombreEfecto1.disabled = true
	nValorEfecto1.editable = false
	nNombreEfecto2.disabled = true
	nValorEfecto2.editable = false

func mirarPoder(nombre : String,poderSet : Dictionary):
	poder = poderSet
	nNombre.text = nombre
	nTipo.select(seleccionarOpcion(nTipo,poder["Categoria"]))
	super._on_option_button_2_item_selected(seleccionarOpcion(nTipo,poder["Categoria"]))
	nFrecuencia.select(seleccionarOpcion(nFrecuencia,poder["Frecuencia"]))
	nDescripcion.text = poder["Descripcion"]
	if nTipo.get_item_text(nTipo.get_selected_id()) == "Poder":
		detallesPoder()
	else:
		detallesDoteRasgo()

func detallesPoder():
	nFuncionalidad.text = poder["Palabras Clave"]
	nImpacto.text = poder["Impacto"]
	nUtilidad.select(seleccionarOpcion(nUtilidad,poder["Tipo"]))

func detallesDoteRasgo():
	nAfectaEstadistica.button_pressed = poder["Afecta"]
	nEfectoPermanente.button_pressed = poder["Permanente"]
	var indexEncontrado = -1
	for llavePoder in poder.keys():
		for index in nNombreEfecto1.item_count:
			if nNombreEfecto1.get_item_text(index) == llavePoder and indexEncontrado == -1:
				nNombreEfecto1.select(index)
				nValorEfecto1.value = poder[llavePoder]
				indexEncontrado = index
				break
		for index in nNombreEfecto2.item_count:
			if nNombreEfecto2.get_item_text(index) == llavePoder and nNombreEfecto2.get_item_text(index) != nNombreEfecto1.get_item_text(indexEncontrado):
				nNombreEfecto2.select(index)
				nValorEfecto2.value = poder[llavePoder]
				break
	nEfectoActivo.button_pressed = poder["Activo"]
	nEfectoActivo.disabled = nEfectoPermanente.button_pressed

func seleccionarOpcion(opciones : OptionButton,opcion : String):
	for index in opciones.item_count:
		if opciones.get_item_text(index) == opcion:
			return index

func _on_option_button_2_item_selected(index):
	print("Nohace nada")

