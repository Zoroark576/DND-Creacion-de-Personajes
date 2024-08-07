extends "res://Scripts/CrearPersonaje/EquipamientoPersonaje/Equipamiento.gd"
@export var nOro : SpinBox
@export var nProficienciaArmadura : CheckBox
@export var nProficienciaMano1 : CheckBox
@export var nProficienciaMano2 : CheckBox
@export var nInventario : TextEdit

func _ready():
	super()
	nOro.value = Personaje.oro
	nProficienciaArmadura.button_pressed = Personaje.armaduraProficiente
	nProficienciaMano1.button_pressed = Personaje.primeraManoProficiente
	nProficienciaMano2.button_pressed = Personaje.segundaManoProficiente
	nArmaduras.select(seleccionarOpcion(nArmaduras,Personaje.armadura))
	nArmaduras.item_selected.emit(nArmaduras.get_item_index(nArmaduras.get_selected_id()))
	nMano1.select(seleccionarOpcion(nMano1,Personaje.primeraMano))
	nMano1.item_selected.emit(nMano1.get_item_index(nMano1.get_selected_id()))
	nMano2.select(seleccionarOpcion(nMano2,Personaje.segundaMano))
	nMano2.item_selected.emit(nMano2.get_item_index(nMano2.get_selected_id()))
	nInventario.text = Personaje.inventario


func seleccionarOpcion(optionButton, opcion : String):
	for index in optionButton.item_count:
		if optionButton.get_item_text(index) == opcion:
			return index
	return 0

