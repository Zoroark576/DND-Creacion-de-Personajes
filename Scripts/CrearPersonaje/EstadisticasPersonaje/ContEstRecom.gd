extends VBoxContainer

@export var nodoTexto : Label
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
var estadisticasRecomendadas

func _ready():
	recursoClase.obtenerClase(Personaje.nombreClase)
	estadisticasRecomendadas = recursoClase.estadisticasRecomendadas
	nodoTexto.text = estadisticasRecomendadas
