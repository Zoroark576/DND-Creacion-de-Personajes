extends GridContainer

var recursoRaza : Raza = preload("res://Recursos/Razas/Raza.tres")
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")

var bonusHabilidades
var habilidadesQueSePuedenEntrenar 
var maxHabilidadesEntrenadas : int 
var numHabilidadesEntrenadasActuales : int

func _ready():
	inicializarDatos()
	for boton : botonHabilidad in get_children():
			var mod = floor((Personaje.estadisticas.get(boton.modificadorAsociado) - 10) /2)
			var valorFinal : int = mod
			if bonusHabilidades.has(boton.obtenerNombreCorto()):
				var bonusHabilidad = bonusHabilidades.get(boton.obtenerNombreCorto())
				valorFinal += bonusHabilidad
			boton.setValue(valorFinal,!habilidadesQueSePuedenEntrenar.has(boton.obtenerNombreCorto()))
			boton.estaEntrenado.connect(botonEntrenado)

func inicializarDatos():
	recursoRaza.obtenerRaza(Personaje.nombreRaza)
	recursoClase.obtenerClase(Personaje.nombreClase)
	bonusHabilidades = recursoRaza.bonificadoresDeHabilidad
	habilidadesQueSePuedenEntrenar = recursoClase.habilidadesEntrenadas
	maxHabilidadesEntrenadas = recursoClase.numHabEntrenadas

func botonEntrenado(estaActivado : bool):
	if estaActivado:
		numHabilidadesEntrenadasActuales += 1
	else:
		numHabilidadesEntrenadasActuales -= 1
	if numHabilidadesEntrenadasActuales == maxHabilidadesEntrenadas:
		for boton : botonHabilidad in get_children():
			if !boton.checkEntrenado.button_pressed:
				boton.setValue(boton.valorHabilidad ,true)
			else:
				boton.setValue(boton.valorHabilidad ,false)
	else:
		for boton : botonHabilidad in get_children():
			boton.setValue(boton.valorHabilidad ,!habilidadesQueSePuedenEntrenar.has(boton.obtenerNombreCorto()))



