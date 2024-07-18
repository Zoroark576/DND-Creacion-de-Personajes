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
	diccionarioRazas = read_json()

func aplicarRaza():
	velocidad = razaSeleccionada["Velocidad"]
	puntuacionesDeCaracteristica = dividirString(razaSeleccionada["Puntuaciones de Caracteristica"])
	bonificadoresDeHabilidad = dividirString(razaSeleccionada["Bonificadores de Habilidad"])
	obtenerHabilidades()

func obtenerHabilidades():
	for indice in razaSeleccionada.size():
		if razaSeleccionada.has("Nombre " + str(indice)) and razaSeleccionada["Nombre " + str(indice)] != "":
			habilidades[str(indice)] = razaSeleccionada["Habilidad " + str(indice)]

func obtenerRaza(nombreRaza):
	if diccionarioRazas.has(nombreRaza):
		nombre = nombreRaza
		razaSeleccionada = diccionarioRazas.get(nombreRaza)
		aplicarRaza()

func iterarRazas(indice):
	var llaves = diccionarioRazas.keys()
	var nombreRaza = llaves[indice]
	obtenerRaza(nombreRaza)

func read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioRazas = json_object.get_data()

func dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValor : Array[String] = string.split(",")
	#TODO: Dividir las habilidades por nombre y valor
