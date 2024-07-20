extends Resource
class_name Raza

@export var directorioJSON : String
var diccionarioRazas : Dictionary
var razaSeleccionada : Dictionary
var nombre : String
var velocidad : int
var puntuacionesDeCaracteristica : Dictionary
var bonificadoresDeHabilidad : Dictionary
var habilidades : Dictionary

func _ready():
	diccionarioRazas = _read_json()

func _aplicarRaza():
	velocidad = razaSeleccionada["Velocidad"]
	puntuacionesDeCaracteristica = _dividirString(razaSeleccionada["Puntuaciones de Caracteristica"])
	bonificadoresDeHabilidad = _dividirString(razaSeleccionada["Bonificadores de Habilidad"])
	_obtenerHabilidades()

func _obtenerHabilidades():
	for indice in razaSeleccionada.size():
		if razaSeleccionada.has("Nombre " + str(indice)) and razaSeleccionada["Nombre " + str(indice)] != "":
			habilidades[str(indice)] = razaSeleccionada["Habilidad " + str(indice)]

func obtenerRaza(nombreRaza):
	if diccionarioRazas.has(nombreRaza):
		nombre = nombreRaza
		razaSeleccionada = diccionarioRazas.get(nombreRaza)
		if diccionarioRazas.is_empty() or diccionarioRazas == null:
			diccionarioRazas = _read_json()
		_aplicarRaza()

func iterarRazas(indice):
	var llaves = diccionarioRazas.keys()
	var nombreRaza = llaves[indice]
	if diccionarioRazas.is_empty() or diccionarioRazas == null:
		diccionarioRazas = _read_json()
	obtenerRaza(nombreRaza)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioRazas = json_object.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor
