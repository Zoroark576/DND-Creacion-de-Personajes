extends HBoxContainer

@export var nCondicionesYEfectos : TextEdit
@export var nDeathSaves : SpinBox
@export var nDeathSaveMod : SpinBox
@export var nSegundoViento : LineEdit
@export var nResistencias : TextEdit
func _ready():
	cargarValores()

func cargarValores():
	nCondicionesYEfectos.text = Personaje.condicionesYEfectos
	nDeathSaves.value = Personaje.deathSaves
	nDeathSaveMod.value = Personaje.deathSaveMod
	nSegundoViento.text = Personaje.seUso2ndoViento
	nResistencias.text = Personaje.resistencias

func guardarValores():
	Personaje.condicionesYEfectos = nCondicionesYEfectos.text 
	Personaje.deathSaves = nDeathSaves.value 
	Personaje.deathSaveMod = nDeathSaveMod.value
	Personaje.seUso2ndoViento = nSegundoViento.text
	Personaje.resistencias = nResistencias.text

func reiniciarValores():
	guardarValores()
	Personaje.condicionesYEfectos = ""
	cargarValores()

