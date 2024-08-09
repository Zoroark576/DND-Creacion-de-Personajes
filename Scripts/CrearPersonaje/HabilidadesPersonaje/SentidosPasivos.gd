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
	#if recursoRaza.otrosBonificadoresDeHabilidad.has("Velocidad"):
		#velocidad += recursoRaza.otrosBonificadoresDeHabilidad.get("Velocidad")
	velocidad += sumarBonusRasgosDotes("Velocidad")
	nVelocidad.asignarValor(velocidad)

func obtenerIniciativa():
	var dexRasgo = sumarBonusRasgosDotes("DEX")
	var modIniciativa = floor(((Personaje.estadisticas["DEX"] + dexRasgo) - 10)/2)
	var iniciativa = modIniciativa
	iniciativa += floor(Personaje.nivel/2)
	#if recursoRaza.otrosBonificadoresDeHabilidad.has("Iniciativa"):
		#iniciativa += recursoRaza.otrosBonificadoresDeHabilidad.get("Iniciativa")
	iniciativa += sumarBonusRasgosDotes("Iniciativa")
	nIniciativa.asignarValor(iniciativa)

func sumarBonusRasgosDotes(nombre):
	var valorFinal = 0
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote]["Activo"] == true:
			valorFinal += Personaje.dotes[dote].get(nombre)
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial"):
			valorFinal += Personaje.rasgosDeClase[rasgo].get(nombre)
	return valorFinal


