extends Resource
class_name Raza

@export var directorioJSON : String
@export var directorioJSON2 : String
var diccionarioRazas : Dictionary
var diccionarioRazas2 : Dictionary
var razaSeleccionada : Dictionary
var nombre : String
var velocidad : int
var puntuacionesDeCaracteristica : Dictionary
var bonificadoresDeHabilidad : Dictionary
var otrosBonificadoresDeHabilidad : Dictionary
var habilidades : Dictionary

func _ready():
	diccionarioRazas = _read_json()

func _aplicarRaza():
	velocidad = razaSeleccionada["Velocidad"]
	puntuacionesDeCaracteristica = _dividirString(razaSeleccionada["Puntuaciones de Caracteristica"])
	bonificadoresDeHabilidad = _dividirString(razaSeleccionada["Bonificadores de Habilidad"])
	_obtenerHabilidades()

func _obtenerHabilidades():
	otrosBonificadoresDeHabilidad.clear()
	habilidades.clear()
	for indice in razaSeleccionada.size():
		if razaSeleccionada.has("Nombre " + str(indice)) and razaSeleccionada["Nombre " + str(indice)] != "":
			habilidades[razaSeleccionada.get("Nombre " + str(indice))] = razaSeleccionada["Habilidad " + str(indice)]
			if !razaSeleccionada["Habilidad " + str(indice)].contains("#"):
				var cadena : String = razaSeleccionada["Habilidad " + str(indice)]
				cadena = cadena.trim_prefix("#")
				cadena = cadena.trim_suffix("#")
				var diccTemp = _dividirString(cadena)
				otrosBonificadoresDeHabilidad.merge(diccTemp)

func obtenerRaza(nombreRaza):
	if diccionarioRazas.has(nombreRaza):
		nombre = nombreRaza
		razaSeleccionada = diccionarioRazas.get(nombreRaza)
		if diccionarioRazas.is_empty() or diccionarioRazas == null:
			diccionarioRazas = _read_json()
		_aplicarRaza()
	elif diccionarioRazas2.has(nombreRaza):
		nombre = nombreRaza
		razaSeleccionada = diccionarioRazas2.get(nombreRaza)
		if diccionarioRazas2.is_empty() or diccionarioRazas2 == null:
			diccionarioRazas2 = _read_json()
		_aplicarRaza()

func iterarRazas(indice):
	var llaves = diccionarioRazas.keys()
	llaves.append_array(diccionarioRazas2.keys())
	var nombreRaza = llaves[indice]
	if diccionarioRazas.is_empty() or diccionarioRazas == null:
		diccionarioRazas = _read_json()
	obtenerRaza(nombreRaza)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioRazas = json_object.get_data()
	
	var f2 = FileAccess.open(directorioJSON2,FileAccess.READ)
	var json_object2 = JSON.new()
	var parse_err2 = json_object2.parse(f2.get_as_text())
	diccionarioRazas2 = json_object2.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor
