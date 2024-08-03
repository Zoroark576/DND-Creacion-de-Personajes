extends Control
var menuCrear = preload("res://Escenas/CrearPoder/CrearPoder.tscn")
@export var contPVoluntad : VBoxContainer
@export var contPEncuentro : VBoxContainer
@export var contPDiarios : VBoxContainer
@export var contPUtilidad : VBoxContainer
@export var contDotes : VBoxContainer
@export var contRasgosClase : VBoxContainer

var botonPoder = preload("res://Escenas/CrearPoder/botonPoder.tscn")

func _ready():
	asignarPoderes()
	asignarDotes()
	asignarRasgosDeClase()

func asignarPoderes():
		for nombrePoder in Personaje.poderes:
			var poder = Personaje.poderes.get(nombrePoder)
			var frecuencia = poder["Frecuencia"]
			var nuevoBoton = crearBoton(nombrePoder,frecuencia,false)
			if poder["Tipo"] == "Ataque":
				match frecuencia:
					"Voluntad":
						contPVoluntad.add_child(nuevoBoton)
					"Encuentro":
						contPEncuentro.add_child(nuevoBoton)
					"Diario":
						contPDiarios.add_child(nuevoBoton)
			else:
				contPUtilidad.add_child(nuevoBoton)

func asignarDotes():
	for nombreDote in Personaje.dotes:
		var dote : Dictionary = Personaje.dotes.get(nombreDote)
		var nuevoBoton = crearBoton(nombreDote,"Dote",dote["Activo"])
		contDotes.add_child(nuevoBoton)


func asignarRasgosDeClase():
	for nombreRasgo in Personaje.rasgosDeClase:
		var rasgo : Dictionary = Personaje.rasgosDeClase.get(nombreRasgo)
		var nuevoBoton = crearBoton(nombreRasgo,"Rasgo De Clase",rasgo["Activo"])
		contRasgosClase.add_child(nuevoBoton)

func _on_crear_pressed():
	get_tree().change_scene_to_packed(menuCrear)

func crearBoton(nombre,frecuencia,doteRasgoActivo : bool):
	var nuevoBoton : botonPoderRasgo = botonPoder.instantiate()
	if frecuencia == "Encuentro" or frecuencia == "Diario":
		nuevoBoton.crearBoton(nombre,true)
	elif frecuencia == "Dote" or frecuencia == "Rasgo De Clase":
		nuevoBoton.crearBoton(nombre,true)
		nuevoBoton.usado.button_pressed = doteRasgoActivo
		nuevoBoton.usado.disabled = true
	else: 
		nuevoBoton.crearBoton(nombre,false)
	return nuevoBoton
