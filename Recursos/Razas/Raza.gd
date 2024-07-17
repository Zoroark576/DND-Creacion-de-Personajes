extends Resource
class_name Raza

var nombre : String
var velocidad : int
var puntuacionesDeCaracteristica : Dictionary
var bonificadoresDeHabilidad : Dictionary
var habilidades : Dictionary

func _init(setNom = "",setVel = 0,setPunt = null,setBoni = null,setHabilidades = null):
	nombre = setNom
	velocidad = setVel
	puntuacionesDeCaracteristica = setPunt
	bonificadoresDeHabilidad = setBoni
	habilidades = setHabilidades


