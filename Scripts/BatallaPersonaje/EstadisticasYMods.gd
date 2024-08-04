extends HBoxContainer

@export var contScores : GridContainer
@export var contMods : VBoxContainer
@export var contModsNiveles : VBoxContainer

func _ready():
	for score in contScores.get_children():
		if score is LineEdit:
			score.text = str(Personaje.estadisticas[score.name])
	for mod in contMods.get_children():
		if mod is LineEdit:
			mod.text = str(floor((Personaje.estadisticas[mod.name]-10)/2))
	for mod in contModsNiveles.get_children():
		if mod is LineEdit:
			mod.text = str(floor((Personaje.estadisticas[mod.name]-10)/2) + floor(Personaje.nivel/2))
