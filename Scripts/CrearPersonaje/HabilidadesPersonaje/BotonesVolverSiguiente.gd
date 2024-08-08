extends botonesVolverSiguiente
@export var contBotonesHabilidad : GridContainer
@export var bonusVelocidad : SpinBox

func _on_siguiente_pressed():
	super()
	var habilidadesEntrenadas = []
	var habilidadesConBonus = []
	for habilidad : botonHabilidad in contBotonesHabilidad.get_children():
		if habilidad.checkEntrenado.button_pressed == true:
			habilidadesEntrenadas.append(habilidad.obtenerNombreCorto())
		if habilidad.nodoBonus.button_pressed == true:
			habilidadesConBonus.append(habilidad.obtenerNombreCorto())
	Personaje.habilidadesEntrenadas = habilidadesEntrenadas
	Personaje.habilidadesConBonus = habilidadesConBonus
	Personaje.bonusVelocidad = bonusVelocidad.value
