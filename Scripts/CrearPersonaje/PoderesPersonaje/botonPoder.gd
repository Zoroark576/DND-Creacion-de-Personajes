extends HBoxContainer
@export var botonPoder : Button
var nombre : String
var tipoDePoder : String

func crearBoton(nombreBoton : String,tipoDePoderSet : String):
	nombre = nombreBoton
	tipoDePoder = tipoDePoderSet
	botonPoder.text = nombre + " : " + tipoDePoder.left(1)
