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
			if score.name == "NV":
				score.text = str(floor(((Personaje.nivel)/2)))
				score.text = score.text.lpad(2,"0")
			else:
				score.text = str(floor(((Personaje.estadisticas[score.name] + modRasgoDote)-10)/2))
				score.text = score.text.lpad(2,"0")
	for score in contEstadisticasNivel.get_children():
		var modRasgoDote = obtenerBonusRasgoDote(score)
		if score is Label and !score.name.contains("L"):
			if score.name == "NV":
				score.text = str(floor(((Personaje.nivel)/2)))
				score.text = score.text.lpad(2,"0")
			else:
				var valor = floor(((Personaje.estadisticas[score.name] + modRasgoDote)-10)/2) + floor(Personaje.nivel/2) + obtenerBonusRasgoDoteEspecifico("Armas")
				score.text = str(valor)
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
	
func obtenerBonusRasgoDoteEspecifico(nombre):
	var modRasgoDote = 0
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and Personaje.rasgosDeClase[rasgo]["Activo"] == true:
			modRasgoDote += Personaje.rasgosDeClase[rasgo].get(nombre)
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and Personaje.dotes[dote]["Activo"] == true:
			modRasgoDote += Personaje.dotes[dote].get(nombre)
	return modRasgoDote

func obtenerDatosPrimeraMano():
	recursoArmas.obtenerArma(Personaje.primeraMano)
	nombreMano1.text = "'" + recursoArmas.nombre + "'"
	dadoMano1.text =  ", Daño: '" + recursoArmas.daño
	var bonusDaño = obtenerBonusRasgoDoteEspecifico("Daño Armas")
	if bonusDaño > 0:
		dadoMano1.text += "+ " + str(bonusDaño) + "'"
	else:
		dadoMano1.text += "'"
	compMano1.visible = true
	compMano1.text ="|D20: " + "'" + aplicarD20(Personaje.primeraManoEstadistica,Personaje.primeraManoProficiente) + "'" + " (" + Personaje.primeraManoEstadistica + ", "
	if Personaje.primeraManoProficiente:
		compMano1.text += str(recursoArmas.competencia) +" Comp"
	else:
		compMano1.text += "N/C"
	var bonus = obtenerBonusRasgoDoteEspecifico("D20 Armas")
	bonus +=  obtenerBonusRasgoDoteEspecifico(Personaje.primeraManoEstadistica)
	if bonus != 0:
		compMano1.text += " ," + str(bonus) + " Dotes.)"
	else: 
			compMano1.text += ")"

func obtenerDatosSegundaMano():
	if Personaje.segundaMano.contains("Escudo"):
		recursoEscudos.obtenerEscudo(Personaje.segundaMano)
		nombreMano2.text = recursoEscudos.nombre
	else:
		recursoArmas.obtenerArma(Personaje.segundaMano)
		nombreMano2.text =  "'" + recursoArmas.nombre +"'"
		dadoMano2.text = ", Daño: '" + recursoArmas.daño
		var bonusDaño = obtenerBonusRasgoDoteEspecifico("Daño Armas")
		if bonusDaño > 0:
			dadoMano2.text += "+ " + str(bonusDaño) + "'"
		else:
			dadoMano2.text += "'"
		compMano2.visible = true
		compMano2.text ="|D20: " + "'" + aplicarD20(Personaje.segundaManoEstadistica,Personaje.segundaManoProficiente) + "'" + " (" + Personaje.segundaManoEstadistica + ", "
		if Personaje.segundaManoProficiente:
			compMano2.text += str(recursoArmas.competencia) +" Comp"
		else:
			compMano2.text += "N/C"
		var bonus = obtenerBonusRasgoDoteEspecifico("D20 Armas")
		bonus +=  obtenerBonusRasgoDoteEspecifico(Personaje.segundaManoEstadistica)
		if bonus != 0:
			compMano2.text += " ," + str(bonus) + " Dotes.)"
		else: 
			compMano2.text += ")"

func aplicarD20(estadistica : String,esCompetente : bool):
	var valor = obtenerBonusRasgoDoteEspecifico("D20 Armas")
	var valDoteEstad = obtenerBonusRasgoDoteEspecifico(estadistica)
	var valorCar = Personaje.estadisticas[estadistica]
	valor += floor(((valorCar + valDoteEstad) -10)/2) + floor(Personaje.nivel/2)
	if esCompetente:
		valor += recursoArmas.competencia
	return str(valor)


