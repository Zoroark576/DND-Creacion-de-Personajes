extends Control
var menuCrear = preload("res://Escenas/CrearPoder/CrearPoder.tscn")
@export var contPVoluntad : VBoxContainer
@export var contPEncuentro : VBoxContainer
@export var contPDiarios : VBoxContainer
@export var contPUtilidad : VBoxContainer
@export var contDotes : VBoxContainer
@export var contRasgosClase : VBoxContainer
@export var nContadoresPoderes : ScrollContainer

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
			var ruta = get_tree().current_scene.scene_file_path
			nuevoBoton.rutaVolver = ruta
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
		var ruta = get_tree().current_scene.scene_file_path
		var dote : Dictionary = Personaje.dotes.get(nombreDote)
		var nuevoBoton = crearBoton(nombreDote,"Dote",dote["Activo"])
		nuevoBoton.rutaVolver = ruta
		contDotes.add_child(nuevoBoton)


func asignarRasgosDeClase():
	for nombreRasgo in Personaje.rasgosDeClase:
		var rasgo : Dictionary = Personaje.rasgosDeClase.get(nombreRasgo)
		var nuevoBoton = crearBoton(nombreRasgo,"Rasgo De Clase",rasgo["Activo"])
		var ruta = get_tree().current_scene.scene_file_path
		nuevoBoton.rutaVolver = ruta
		contRasgosClase.add_child(nuevoBoton)

func _on_crear_pressed():
	var nuevaEscena = menuCrear.instantiate()
	var ruta = str(get_tree().current_scene.scene_file_path)
	nuevaEscena.asignarVolver(ruta)
	get_tree().root.add_child(nuevaEscena)
	get_tree().root.remove_child(self)

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
