extends Control

@export var contDatos : GridContainer
@export var nNombre : LineEdit

func _ready():
	for dato in contDatos.get_children():
		if dato.name == "Nombre":
			nNombre.text = Personaje.nombre
		elif dato is LineEdit:
			dato.text = Personaje.lore[dato.name]
		elif dato is opcionRazaClase:
			if dato.name == "Raza":
				dato.seleccionarOpcion(Personaje.nombreRaza)
			elif dato.name == "Clase":
				dato.seleccionarOpcion(Personaje.nombreClase)
		elif dato is SpinBox:
			dato.value = Personaje.lore[dato.name]
		elif dato is TextEdit:
			dato.text = Personaje.lore[dato.name]
