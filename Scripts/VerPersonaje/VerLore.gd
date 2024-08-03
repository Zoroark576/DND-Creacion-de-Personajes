extends Control

@export var contDatos : GridContainer

func _ready():
	for dato in contDatos.get_children():
		if dato is LineEdit:
			dato.text = Personaje.lore[dato.name]
		if dato is opcionRazaClase:
			if dato.name == "Raza":
				dato.seleccionarOpcion(Personaje.nombreRaza)
			elif dato.name == "Clase":
				dato.seleccionarOpcion(Personaje.nombreClase)
		if dato is SpinBox:
			dato.value = Personaje.lore[dato.name]
		if dato is TextEdit:
			dato.text = Personaje.lore[dato.name]
