extends HBoxContainer

@export_group("Nodos")
@export var nNombre : Label
@export var nVidaAct : SpinBox
@export var nVidaMax : LineEdit
@export var nEnsang : LineEdit
@export var nValEsf : LineEdit
@export var nNumEsfuerzos : SpinBox
@export var nMaxNumEsfuerzos : LineEdit

var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")

func _ready():
	recursoClase._read_json()
	recursoClase.obtenerClase(Personaje.nombreClase)
	recursoRaza._read_json()
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	nNombre.text = Personaje.nombre
	declararVida()

func declararVida():
	var vida
	for valor in recursoClase.vidaInicial:
		vida = recursoClase.vidaInicial[valor]
		vida += Personaje.estadisticas[valor] + sumarBonusRasgosDotes(valor)
		vida += recursoClase.vidaXNivel * (Personaje.nivel - 1)
		break
	nVidaMax.text = str(vida)
	if Personaje.vidaTemp <= -1000:
		nVidaAct.value = vida
	else:
		nVidaAct.value = Personaje.vidaTemp
	declararOtrosValoresVida(vida)

func declararOtrosValoresVida(vida):
	nEnsang.text = str(floor(vida/2))
	if Personaje.nombreRaza == "Dracónido":
		nValEsf.text = str(floor(vida/4) + floor((Personaje.estadisticas["CON"] - 10)/2))
	else:
		nValEsf.text = str(floor(vida/4))
	var numEsfuerzo
	for valor in recursoClase.vidaInicial:
		numEsfuerzo = recursoClase.numEsfuerzosCurativos[valor]
		numEsfuerzo += floor((Personaje.estadisticas[valor] - 10)/2)
		break
	if recursoRaza.otrosBonificadoresDeHabilidad.has("HealingSurge"):
		numEsfuerzo += recursoRaza.otrosBonificadoresDeHabilidad.get("HealingSurge")
	numEsfuerzo += sumarBonusRasgosDotes("HealingSurge")
	nMaxNumEsfuerzos.text = str(numEsfuerzo)
	if Personaje.urgTemp <= -1000:
		nNumEsfuerzos.value = numEsfuerzo
		nNumEsfuerzos.max_value = numEsfuerzo
	else:
		nNumEsfuerzos.value = Personaje.urgTemp
		nNumEsfuerzos.max_value = numEsfuerzo

func sumarBonusRasgosDotes(nombre):
	var valorFinal = 0
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote]["Activo"] == true:
			valorFinal += Personaje.dotes[dote].get(nombre)
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial"):
			valorFinal += Personaje.rasgosDeClase[rasgo].get(nombre)
	return valorFinal
func reiniciarValores():
	Personaje.vidaTemp = -1000
	Personaje.urgTemp = -1000
	declararVida()

func guardarValores():
	Personaje.vidaTemp = nVidaAct.value
	Personaje.urgTemp = nNumEsfuerzos.value

