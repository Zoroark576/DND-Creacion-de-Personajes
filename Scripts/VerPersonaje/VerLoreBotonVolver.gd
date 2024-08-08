extends botonesVolverSiguiente

@export var contDatos : GridContainer
@export var nNombre : LineEdit

func _on_volver_pressed():
	for dato in contDatos.get_children():
		if dato is LineEdit:
			Personaje.lore[dato.name] = dato.text 
		elif dato is SpinBox:
			Personaje.lore[dato.name] = dato.value
		elif dato is TextEdit:
			Personaje.lore[dato.name] = dato.text
	super()
