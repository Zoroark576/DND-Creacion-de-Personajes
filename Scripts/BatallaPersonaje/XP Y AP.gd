extends GridContainer
@export var nNivel : LineEdit
@export var nAP : SpinBox
@export var nInspiracion : SpinBox

func _ready():
	cargarValores()

func cargarValores():
	nNivel.text = str(Personaje.nivel)
	nAP.value = Personaje.actionPoints
	nInspiracion.value = Personaje.inspiracion

func guardarValores():
	Personaje.actionPoints = nAP.value
	Personaje.inspiracion = nInspiracion.value

func reiniciarValores():
	Personaje.actionPoints = 1
	Personaje.inspiracion = 0
	cargarValores()
