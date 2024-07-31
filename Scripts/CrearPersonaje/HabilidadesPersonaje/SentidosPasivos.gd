extends VBoxContainer

@export var nPercepcion : botonDefensa
@export var nPerspicacia : botonDefensa
@export var nVelocidad : botonDefensa
@export var nIniciativa : botonDefensa

@export var bonificadorPercepcion : botonHabilidad
@export var bonificadorPerspicacia : botonHabilidad

var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")
var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")

func _ready():
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	recursoArmadura.obtenerArmadura(Personaje.armadura)
	obtenerVelocidad()
	obtenerIniciativa()

func _process(delta):
	nPercepcion.asignarValor(bonificadorPercepcion.valorHabilidad + 10)
	nPerspicacia.asignarValor(bonificadorPerspicacia.valorHabilidad + 10)

func obtenerVelocidad():
	var velocidad = recursoRaza.velocidad
	velocidad += recursoArmadura.velocidad
	if recursoRaza.otrosBonificadoresDeHabilidad.has("Velocidad"):
		velocidad += recursoRaza.otrosBonificadoresDeHabilidad.get("Velocidad")
	nVelocidad.asignarValor(velocidad)

func obtenerIniciativa():
	var modIniciativa = floor((Personaje.estadisticas["DEX"] - 10)/2)
	var iniciativa = modIniciativa
	iniciativa += floor(Personaje.nivel/2)
	if recursoRaza.otrosBonificadoresDeHabilidad.has("Iniciativa"):
		iniciativa += recursoRaza.otrosBonificadoresDeHabilidad.get("Iniciativa")
	nIniciativa.asignarValor(iniciativa)
