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
	nMano1.select(seleccionarOpcion(nMano1,Personaje.primeraMano))
	nMano2.select(seleccionarOpcion(nMano2,Personaje.segundaMano))
	nInventario.text = Personaje.inventario


func seleccionarOpcion(optionButton, opcion : String):
	for index in optionButton.item_count:
		if optionButton.get_item_text(index) == opcion:
			return index

