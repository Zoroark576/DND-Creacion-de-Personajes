extends GridContainer

var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")

var bonusHabilidades
var habilidadesQueSePuedenEntrenar : Dictionary
var maxHabilidadesEntrenadas : int 
var numHabilidadesEntrenadasActuales : int

var cantMaxTrainsExtra
var trainsExtraUsados = 0 #Si se haa entrenado una habilidad que no este en las caracteristicas base (EX. Humano)

@export var nombresYClaves : Dictionary

func _ready():
	asignarNombres()
	inicializarDatos()
	for boton : botonHabilidad in get_children():
			var mod = floor((Personaje.estadisticas.get(boton.modificadorAsociado) - 10) /2)
			var valorFinal : int = mod
			if bonusHabilidades.has(boton.obtenerNombreCorto()):
				var bonusHabilidad = bonusHabilidades.get(boton.obtenerNombreCorto())
				valorFinal += bonusHabilidad
			setearBotonesParaEntrenamiento(boton,valorFinal)
			if bonusHabilidades.has("ANY"):
				boton.setBonus(true,bonusHabilidades.get("ANY"))
			boton.estaEntrenado.connect(botonEntrenado)
			boton.bonusAnyActivado.connect(bonusAnyActivado)

func inicializarDatos():
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	recursoClase.obtenerClase(Personaje.nombreClase)
	bonusHabilidades = recursoRaza.bonificadoresDeHabilidad
	habilidadesQueSePuedenEntrenar = recursoClase.habilidadesEntrenadas
	maxHabilidadesEntrenadas = recursoClase.numHabEntrenadas
	if bonusHabilidades.has("Train"):
		maxHabilidadesEntrenadas += bonusHabilidades.get("Train")
		cantMaxTrainsExtra = bonusHabilidades.get("Train")

func botonEntrenado(estaActivado : bool,nombreCorto : String):
	if estaActivado:
		numHabilidadesEntrenadasActuales += 1
	else:
		numHabilidadesEntrenadasActuales -= 1
	if !habilidadesQueSePuedenEntrenar.has(nombreCorto):
		
	if numHabilidadesEntrenadasActuales == maxHabilidadesEntrenadas:
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
	if Personaje.nombreRaza == "Humano":
		sePuedeEntrenar = true
	else:
		sePuedeEntrenar = habilidadesQueSePuedenEntrenar.has(boton.obtenerNombreCorto())
	boton.setValue(valorFinal,sePuedeEntrenar)

func asignarNombres():
	var nombresHabilidad = nombresYClaves.keys()
	var caracteristicasHabilidad = nombresYClaves.values()
	for index in get_child_count():
		get_child(index).setNombre(nombresHabilidad[index],caracteristicasHabilidad[index])


