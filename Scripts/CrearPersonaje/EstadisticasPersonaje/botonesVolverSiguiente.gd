extends botonesVolverSiguiente

@export var contValores : VBoxContainer

func _on_siguiente_pressed():
	super()
	for valor : SpinBox in contValores.get_children():
		Personaje.estadisticas[valor.name] = valor.value
