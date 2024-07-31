extends GridContainer

var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
@export var nodoArmaduras : Label
@export var nodoArmas : Label

func _ready():
	recursoClase.obtenerClase(Personaje.nombreClase)
	nodoArmaduras.text = recursoClase.competenciasArmaduras
	nodoArmas.text = recursoClase.competenciasArmas
