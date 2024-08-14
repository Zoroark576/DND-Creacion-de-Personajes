extends GridContainer

var recursoClase : Clase = load("res://Recursos/Clases/Clase.tres")
@export var nodoArmaduras : Label
@export var nodoArmas : Label

func _ready():
	recursoClase._read_json()
	recursoClase.obtenerClase(Personaje.nombreClase)
	var comp = recursoClase.competenciasArmaduras
	nodoArmaduras.text = comp
	var armComp = recursoClase.competenciasArmas
	nodoArmas.text =  armComp
