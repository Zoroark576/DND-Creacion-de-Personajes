extends HBoxContainer

@export_group("Defensas")
@export var aC : PanelContainer
@export var fortaleza : PanelContainer
@export var reflejos : PanelContainer
@export var voluntad : PanelContainer

var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")
var recursoEscudo : Escudo = preload("res://Recursos/Escudos/Escudo.tres")
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")

var bonificacionTotal
# Called when the node enters the scene tree for the first time.
func _ready():
	recursoClase.obtenerClase(Personaje.nombreClase)
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	var bonificacionArmadura
	var bonificacionEscudo 
	bonificacionArmadura = obtenerBonificadoresArmadura()
	bonificacionEscudo = obtenerBonificadoresEscudo()
	bonificacionTotal = bonificacionArmadura + bonificacionEscudo
	calcularAC(bonificacionTotal)
	calcularFortaleza()
	calcularReflejos(bonificacionEscudo)
	calcularVoluntad()

func obtenerBonificadoresArmadura():
	recursoArmadura._read_json()
	if Personaje.armadura != "Ninguno":
		recursoArmadura.obtenerArmadura(Personaje.armadura)
		return recursoArmadura.bonificador
	else:
		return 0
	

func obtenerBonificadoresEscudo():
	recursoEscudo._read_json()
	if Personaje.segundaMano.contains("Escudo"):
		recursoEscudo.obtenerEscudo(Personaje.segundaMano)
		return recursoEscudo.bonificador
	else:
		return 0

func calcularAC(bonus,modAsociado = "No"):
	var acValor = 10 + floor(Personaje.nivel/2)
	acValor += bonus
	var dexDote = sumasBonusCaracteristicasRasgosDotes("DEX")
	var conDote = sumasBonusCaracteristicasRasgosDotes("CON")
	var modDex = floor(((Personaje.estadisticas["DEX"] + dexDote) - 10)/2)
	var modCon = floor(((Personaje.estadisticas["CON"] + conDote) - 10)/2)
	var valorModModificado
	if modAsociado != "No":
		valorModModificado = floor(((Personaje.estadisticas[modAsociado] + sumasBonusCaracteristicasRasgosDotes(modAsociado)) - 10)/2)
	if recursoArmadura.tipoArmadura == "L" and modAsociado == "No":
		acValor += compararValores(modDex,modCon)
	elif recursoArmadura.tipoArmadura == "L" and modAsociado != "No":
		acValor += valorModModificado
	acValor += sumarBonusRasgosDotes("AC")
	aC.cambioMod.connect(cambioModAC)
	aC.asignarValor(acValor)

func cambioModAC(modAsociado):
	calcularAC(bonificacionTotal,modAsociado)

func calcularFortaleza():
	var fueDote = sumasBonusCaracteristicasRasgosDotes("STR")
	var conDote = sumasBonusCaracteristicasRasgosDotes("CON")
	var modFue = floor(((Personaje.estadisticas["STR"] + fueDote) - 10)/2)
	var modCon = floor(((Personaje.estadisticas["CON"] + conDote) - 10)/2)
	var fortValor = 10 + floor(Personaje.nivel/2)
	fortValor += (compararValores(modFue,modCon))
	if recursoClase.defensas.has("Fortaleza"):
		fortValor += recursoClase.defensas.get("Fortaleza")
	#if recursoRaza.otrosBonificadoresDeHabilidad.has("Fortaleza"):
		#fortValor += recursoRaza.otrosBonificadoresDeHabilidad.get("Fortaleza")
	fortValor += sumarBonusRasgosDotes("Fortaleza")
	fortaleza.asignarValor(fortValor)

func calcularReflejos(bonusEscudo):
	var reflValor = 10 + floor(Personaje.nivel/2)
	var dexDote = sumasBonusCaracteristicasRasgosDotes("DEX")
	var intDote = sumasBonusCaracteristicasRasgosDotes("INT")
	var modDex = floor(((Personaje.estadisticas["DEX"] + dexDote) - 10)/2)
	var modInt = floor(((Personaje.estadisticas["INT"] + intDote) - 10)/2)
	reflValor += bonusEscudo + compararValores(modDex,modInt)
	if recursoClase.defensas.has("Reflejos"):
		reflValor += recursoClase.defensas.get("Reflejos")
	#if recursoRaza.otrosBonificadoresDeHabilidad.has("Reflejos"):
		#reflValor += recursoRaza.otrosBonificadoresDeHabilidad.get("Reflejos")
	if !Personaje.armaduraProficiente:
		reflValor -= 2
	reflValor += sumarBonusRasgosDotes("Reflejos")
	reflejos.asignarValor(reflValor)

func calcularVoluntad():
	var volValor = 10 + floor(Personaje.nivel/2)
	var wisDote = sumasBonusCaracteristicasRasgosDotes("WIS")
	var chaDote = sumasBonusCaracteristicasRasgosDotes("CHA")
	var modSab = floor(((Personaje.estadisticas["WIS"] + wisDote) - 10)/2)
	var modCar = floor(((Personaje.estadisticas["CHA"] + chaDote) - 10)/2)
	volValor += compararValores(modSab,modCar)
	if recursoClase.defensas.has("Voluntad"):
		volValor += recursoClase.defensas.get("Voluntad")
	#if recursoRaza.otrosBonificadoresDeHabilidad.has("Voluntad"):
		#volValor += recursoRaza.otrosBonificadoresDeHabilidad.get("Voluntad")
	volValor += sumarBonusRasgosDotes("Voluntad")
	voluntad.asignarValor(volValor)

func sumarBonusRasgosDotes(nombre):
	var valorFinal = 0
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote]["Activo"] == true:
			valorFinal += Personaje.dotes[dote].get(nombre)
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial"):
			valorFinal += Personaje.rasgosDeClase[rasgo].get(nombre)
	return valorFinal

func sumasBonusCaracteristicasRasgosDotes(nombre):
	var modRasgoDote = 0
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial") and Personaje.rasgosDeClase[rasgo].get("Activo") == true:
			modRasgoDote += Personaje.rasgosDeClase[rasgo].get(nombre)
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote].get("Activo") == true:
			modRasgoDote += Personaje.dotes[dote].get(nombre)
	return modRasgoDote

func compararValores(valor1,valor2):
	if valor1 >= valor2:
		return valor1
	else:
		return valor2
		
#TODO Termianr calculo de defensas tomando en cuenta los valores de las habilidades
