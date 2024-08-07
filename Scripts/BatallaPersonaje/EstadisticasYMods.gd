extends HBoxContainer

@export var contScores : GridContainer
@export var contMods : VBoxContainer
@export var contModsNiveles : VBoxContainer

func _ready():
	calcularScores()
	calcularMods()
	calcularModsYNivel()

func calcularScores():
	for score in contScores.get_children():
		if score is LineEdit:
			var valor = Personaje.estadisticas[score.name]
			valor += sumarBonusRasgosDotes(score.name)
			score.text = str(valor)

func calcularMods():
	for mod in contMods.get_children():
		if mod is LineEdit:
			var valor = Personaje.estadisticas[mod.name] + sumarBonusRasgosDotes(mod.name)
			valor = floor((valor-10)/2)
			mod.text = str(valor)

func calcularModsYNivel():
	for mod in contModsNiveles.get_children():
		if mod is LineEdit:
			var valor = Personaje.estadisticas[mod.name] + sumarBonusRasgosDotes(mod.name)
			mod.text = str(floor((valor-10)/2) + floor(Personaje.nivel/2))

func sumarBonusRasgosDotes(nombre):
	var valorFinal = 0
	for dote in Personaje.dotes:
		if Personaje.dotes[dote].has(nombre) and !Personaje.dotes[dote].has("Inicial") and Personaje.dotes[dote]["Activo"] == true:
			valorFinal += Personaje.dotes[dote].get(nombre)
	for rasgo in Personaje.rasgosDeClase:
		if Personaje.rasgosDeClase[rasgo].has(nombre) and !Personaje.rasgosDeClase[rasgo].has("Inicial"):
			valorFinal += Personaje.rasgosDeClase[rasgo].get(nombre)
	return valorFinal
