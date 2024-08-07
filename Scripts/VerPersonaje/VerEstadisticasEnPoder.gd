extends VBoxContainer

var recursoArmas : Arma = load("res://Recursos/Armas/Arma.tres")
var recursoEscudos : Escudo = load("res://Recursos/Escudos/Escudo.tres")
@export var contEstadisticas : GridContainer
@export var contEstadisticasNivel : GridContainer
@export var nombreMano1 : Label
@export var dadoMano1 : Label
@export var compMano1 : Label
@export var nombreMano2 : Label
@export var dadoMano2 : Label
@export var compMano2 : Label

func _ready():
	recursoArmas._read_json()
	recursoEscudos._read_json()
	for score in contEstadisticas.get_children():
		var modRasgoDote = obtenerBonusRasgoDote(score)
		if score is Label and !score.name.contains("L"):
			score.text = str(floor(((Personaje.estadisticas[score.name] + modRasgoDote)-10)/2))
			score.text = score.text.lpad(2,"0")
	for score in contEstadisticasNivel.get_children():
		var modRasgoDote = obtenerBonusRasgoDote(score)
		if score is Label and !score.name.contains("L"):
			score.text = str(floor(((Personaje.estadisticas[score.name] + modRasgoDote)-10)/2) + floor(Personaje.nivel/2))
			score.text = score.text.lpad(2,"0")
	obtenerDatosPrimeraMano()
	obtenerDatosSegundaMano()

func obtenerBonusRasgoDote(score):
	var modRasgoDote = 0
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(score.name):
			modRasgoDote += Personaje.rasgosDeClase[rasgo].get(score.name)
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(score.name):
			modRasgoDote += Personaje.dotes[dote].get(score.name)
	return modRasgoDote

func obtenerDatosPrimeraMano():
	recursoArmas.obtenerArma(Personaje.primeraMano)
	nombreMano1.text = recursoArmas.nombre
	dadoMano1.text = recursoArmas.daño
	if Personaje.primeraManoProficiente:
		compMano1.text = "+ " + str(recursoArmas.competencia)
		compMano1.visible = true

func obtenerDatosSegundaMano():
	if Personaje.segundaMano.contains("Escudo"):
		recursoEscudos.obtenerEscudo(Personaje.segundaMano)
		nombreMano2.text = recursoEscudos.nombre
	else:
		recursoArmas.obtenerArma(Personaje.segundaMano)
		nombreMano2.text = recursoArmas.nombre
		dadoMano2.text = recursoArmas.daño
		if Personaje.primeraManoProficiente:
			compMano2.text = "+ " + str(recursoArmas.competencia)
			compMano2.visible = true

