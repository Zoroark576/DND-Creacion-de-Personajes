extends GridContainer

var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")

var bonusHabilidades
var otrosBonusHabilidad
var habilidadesQueSePuedenEntrenar : PackedStringArray
var maxHabilidadesEntrenadas : int 
var numHabilidadesEntrenadasActuales : int
var habilidadesObligatorias

var cantMaxTrainsExtra = -1
var trainsExtraUsados = 0 #Si se haa entrenado una habilidad que no este en las caracteristicas base (EX. Humano)

@export var nombresYClaves : Dictionary

func _ready():
	asignarNombres()
	inicializarDatos()
	for boton : botonHabilidad in get_children():
			var valorFinal = aplicarBonusYPenalizaciones(boton)
			var habilidadYaEntrenada = false
			if !Personaje.habilidadesEntrenadas.is_empty():
				if Personaje.habilidadesEntrenadas.has(boton.obtenerNombreCorto()):
					habilidadYaEntrenada = true
					numHabilidadesEntrenadasActuales += 1
			if !Personaje.habilidadesConBonus.is_empty():
				if Personaje.habilidadesConBonus.has(boton.obtenerNombreCorto()):
					boton.nodoBonus.button_pressed = true
					bonusAnyActivado(true)
			checarLimiteNumHabilidadesEntrenadas()
			boton.habilidadYaEntrenada = habilidadYaEntrenada
			if habilidadesObligatorias.has(boton.obtenerNombreCorto()):
				boton.setNombre(boton.nombreHabilidad.text + "*",boton.modificadorAsociado)
			boton.estaEntrenado.connect(botonEntrenado)
			boton.bonusAnyActivado.connect(bonusAnyActivado)
			setearBotonesParaEntrenamiento(boton,valorFinal)
			if bonusHabilidades.has("ANY"):
				boton.setBonus(true,bonusHabilidades.get("ANY"))

func aplicarBonusYPenalizaciones(boton):
	var modRasgoDote = 0
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(boton.modificadorAsociado) and !Personaje.rasgosDeClase[rasgo].has("Inicial") and Personaje.rasgosDeClase[rasgo].get("Activo") == true:
			modRasgoDote += Personaje.rasgosDeClase[rasgo].get(boton.modificadorAsociado)
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(boton.modificadorAsociado) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote].get("Activo") == true:
			modRasgoDote += Personaje.dotes[dote].get(boton.modificadorAsociado)
	var mod = floor(((Personaje.estadisticas.get(boton.modificadorAsociado) + modRasgoDote)- 10) /2)
	var valorFinal : int = mod + floor(Personaje.nivel/2)
	if bonusHabilidades.has(boton.obtenerNombreCorto()):
		var bonusHabilidad = bonusHabilidades.get(boton.obtenerNombreCorto())
		valorFinal += bonusHabilidad
	if otrosBonusHabilidad.has(boton.obtenerNombreCorto()):
		var bonusHabilidad = otrosBonusHabilidad.get(boton.obtenerNombreCorto())
		valorFinal += bonusHabilidad
	if boton.modificadorAsociado == "STR" or boton.modificadorAsociado == "DEX" or boton.modificadorAsociado == "CON":
		valorFinal += recursoArmadura.pruebaHabilidad
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(boton.nombreHabilidad.text) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote]["Activo"] == true:
			valorFinal += Personaje.dotes[dote].get(boton.nombreHabilidad.text)
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(boton.nombreHabilidad.text) and !Personaje.rasgosDeClase[rasgo].has("Inicial"):
			valorFinal += Personaje.rasgosDeClase[rasgo].get(boton.nombreHabilidad.text)
	
	return valorFinal

func inicializarDatos():
	recursoRaza._read_json()
	recursoClase._read_json()
	recursoArmadura._read_json()
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	recursoClase.obtenerClase(Personaje.nombreClase)
	recursoArmadura.obtenerArmadura(Personaje.armadura)
	bonusHabilidades = recursoRaza.bonificadoresDeHabilidad
	otrosBonusHabilidad = recursoRaza.otrosBonificadoresDeHabilidad
	habilidadesQueSePuedenEntrenar = recursoClase.habilidadesEntrenadas
	maxHabilidadesEntrenadas = recursoClase.numHabEntrenadas
	habilidadesObligatorias = recursoClase.habilidadesObligatorias
	if bonusHabilidades.has("Train"):
		maxHabilidadesEntrenadas += bonusHabilidades.get("Train")
		cantMaxTrainsExtra = bonusHabilidades.get("Train")

func botonEntrenado(estaActivado : bool,nombreCorto : String):
	if estaActivado:
		numHabilidadesEntrenadasActuales += 1
		if !habilidadesQueSePuedenEntrenar.has(nombreCorto):
			trainsExtraUsados += 1
	else:
		numHabilidadesEntrenadasActuales -= 1
		if !habilidadesQueSePuedenEntrenar.has(nombreCorto):
			trainsExtraUsados -= 1
	checarLimiteNumHabilidadesEntrenadas()


func checarLimiteNumHabilidadesEntrenadas():
	if numHabilidadesEntrenadasActuales >= maxHabilidadesEntrenadas:
		for boton : botonHabilidad in get_children():
			if boton.checkEntrenado.button_pressed:
				boton.setValue(boton.valorHabilidad ,true)
			else:
				boton.setValue(boton.valorHabilidad ,false)
	else:
		for boton : botonHabilidad in get_children():
			setearBotonesParaEntrenamiento(boton,boton.valorHabilidad)

func bonusAnyActivado(estaActivado : bool):
	for boton : botonHabilidad in get_children():
		if boton.nodoBonus.button_pressed == false:
			boton.nodoBonus.disabled = estaActivado

func setearBotonesParaEntrenamiento(boton,valorFinal):
	var sePuedeEntrenar = false
	var habilidadYaEntrenada = false
	if (cantMaxTrainsExtra != -1 and trainsExtraUsados < cantMaxTrainsExtra) or boton.checkEntrenado.button_pressed == true:
		sePuedeEntrenar = true
	else:
		sePuedeEntrenar = habilidadesQueSePuedenEntrenar.has(boton.obtenerNombreCorto())
	boton.setValue(valorFinal,sePuedeEntrenar)

func asignarNombres():
	var nombresHabilidad = nombresYClaves.keys()
	var caracteristicasHabilidad = nombresYClaves.values()
	for index in get_child_count():
		get_child(index).setNombre(nombresHabilidad[index],caracteristicasHabilidad[index])


