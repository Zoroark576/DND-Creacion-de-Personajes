extends GridContainer
@export var contArmadura : HBoxContainer
@export var contMano1 : HBoxContainer
@export var contMano2 : HBoxContainer
@export var contNombresEscudo : HBoxContainer

@export var opcionArmadura : OptionButton
@export var opcionMano1 : OptionButton
@export var opcionMano2 : OptionButton
@export var estadMano1 : OptionButton
@export var estadMano2 : OptionButton
@export var proficiente1 : CheckBox
@export var proficiente2 : CheckBox

var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")
var recursoArma : Arma = preload("res://Recursos/Armas/Arma.tres")
var recursoEscudo : Escudo = preload("res://Recursos/Escudos/Escudo.tres")

func _ready():
	recursoArmadura._read_json()
	recursoArma._read_json()
	recursoEscudo._read_json()


func _on_a_input_item_selected(index):
	recursoArmadura.obtenerArmadura(opcionArmadura.get_item_text(index))
	if opcionArmadura.get_item_text(index) == "Ninguno":
		for estadistica : Label in contArmadura.get_children():
			estadistica.text = "0"
	else:
		for estadistica : Label in contArmadura.get_children():
			estadistica.text = str(recursoArmadura.armaduraSeleccionada[estadistica.name])

func _on_a_input_2_item_selected(index):
	aplicarEstadisticasMano1(index,false)

func _on_a_input_3_item_selected(index):
	aplicarEstadisticasMano2(index,false)
func aplicarEstadisticasMano1(index,recursivo : bool):
	recursoArma.obtenerArma(opcionMano1.get_item_text(index))
	for estadistica : Label in contMano1.get_children():
		if index == 0:
			estadistica.text = "0"
		elif estadistica.name == "D20":
			estadistica.text = aplicarD20(estadMano1,proficiente1.button_pressed)
		elif estadistica.name == "Daño":
			estadistica.text = str(recursoArma.armaSeleccionada[estadistica.name])
			var bonusDaño = sumasBonusCaracteristicasRasgosDotes("Daño Armas")
			if bonusDaño > 0:
				estadistica.text += " + " + str(bonusDaño)
		elif estadistica.name == "Rango":
			estadistica.text = str(recursoArma.armaSeleccionada["Rango"] + " " + recursoArma.armaSeleccionada["Alcance"])
		else:
			estadistica.text = str(recursoArma.armaSeleccionada[estadistica.name])
	if (recursoArma.manos == 2 and opcionMano1.get_item_text(index) != "Ninguno") and recursivo == false:
		aplicarEstadisticasMano2(index,true)

func aplicarEstadisticasMano2(index,recursivo : bool):
	var recursoSeleccionado
	if opcionMano2.get_item_text(index).contains("Escudo"):
		contNombresEscudo.visible = true
		recursoEscudo.obtenerEscudo(opcionMano2.get_item_text(index))
		recursoArma.obtenerArma(opcionMano2.get_item_text(0))
		for estadistica : Label in contMano2.get_children():
			match estadistica.name:
				"Daño":estadistica.text = str(recursoEscudo.escudoSeleccionada["Bonificador"])
				"D20":estadistica.text = str(recursoEscudo.escudoSeleccionada["Prueba"])
				"Rango":estadistica.text = str(recursoEscudo.escudoSeleccionada["Velocidad"])
				_: estadistica.text = str(recursoEscudo.escudoSeleccionada[estadistica.name])
			
	else:
		contNombresEscudo.visible = false
		var texto = opcionMano2.get_item_text(index)
		recursoArma.obtenerArma(texto)
		for estadistica : Label in contMano2.get_children():
			if index == 0:
				estadistica.text = "0"
			elif estadistica.name == "D20":
				estadistica.text = aplicarD20(estadMano2,proficiente2.button_pressed)
			elif estadistica.name == "Daño":
				estadistica.text = str(recursoArma.armaSeleccionada[estadistica.name])
				var bonusDaño = sumasBonusCaracteristicasRasgosDotes("Daño Armas")
				if bonusDaño > 0:
					estadistica.text += " + " + str(bonusDaño)
			elif estadistica.name == "Rango":
				estadistica.text = str(recursoArma.armaSeleccionada["Rango"] + " " + recursoArma.armaSeleccionada["Alcance"])
			else:
				estadistica.text = str(recursoArma.armaSeleccionada[estadistica.name])
	if (recursoArma.manos == 2)  and recursivo == false:
		aplicarEstadisticasMano1(index,true)
	
func aplicarD20(botonOpciones : OptionButton,esCompetente : bool):
	var valor = sumasBonusCaracteristicasRasgosDotes("D20 Armas")
	var nombreCorto = botonOpciones.get_item_text(botonOpciones.get_item_index(botonOpciones.get_selected_id()))
	var valorCar = Personaje.estadisticas[nombreCorto] + sumasBonusCaracteristicasRasgosDotes(nombreCorto)
	valor += floor((valorCar -10)/2) + floor(Personaje.nivel/2)
	if esCompetente:
		valor += recursoArma.competencia
	return str(valor)

func sumasBonusCaracteristicasRasgosDotes(nombre):
	var modRasgoDote = 0
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial") and Personaje.rasgosDeClase[rasgo].get("Activo") == true:
			modRasgoDote += Personaje.rasgosDeClase[rasgo].get(nombre)
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote].get("Activo") == true:
			modRasgoDote += Personaje.dotes[dote].get(nombre)
	return modRasgoDote


func _on_estad_arma_1_item_selected(index):
	_on_a_input_2_item_selected(opcionMano1.get_item_index(opcionMano1.get_selected_id()))


func _on_arma_proficiencia_pressed():
	_on_a_input_2_item_selected(opcionMano1.get_item_index(opcionMano1.get_selected_id()))


func _on_estad_arma_2_item_selected(index):
	_on_a_input_3_item_selected(opcionMano2.get_item_index(opcionMano2.get_selected_id()))


func _on_arma_2_proficiencia_pressed():
	_on_a_input_3_item_selected(opcionMano2.get_item_index(opcionMano2.get_selected_id()))
