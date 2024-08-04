extends PanelContainer

@export var contVariables : VBoxContainer
@export var contVariablesAnteriores : VBoxContainer

func _ready():
	cargarValores()
	
func cargarValores():
	for variable in contVariables.get_children():
		variable.value = Personaje.estadisticas[variable.name]
	for variable in contVariablesAnteriores.get_children():
		variable.value = Personaje.estadisticas[variable.name]

