extends Resource
class_name Clase

@export var directorioJSON : String
var diccionarioClases : Dictionary
var claseSeleccionada : Dictionary
var nombre : String
var vidaInicial : Dictionary
var defensas : Dictionary
var vidaXNivel : int
var valorEsfuerzoCurativo : Dictionary
var numHabEntrenadas : int
var habilidadesEntrenadas 
var rasgos : Dictionary

func _ready():
	diccionarioClases = _read_json()

func _aplicarClase():
	vidaInicial = _dividirString(claseSeleccionada["Vida Inicial"])
	defensas = _dividirString(claseSeleccionada["Defensa"])
	vidaXNivel = claseSeleccionada["Vida x Nivel"]
	valorEsfuerzoCurativo = _dividirString(claseSeleccionada["Esfuerzos Curativos"])
	numHabEntrenadas = claseSeleccionada["Num Hab. Entrenadas"]
	_obtenerHabilidadesEntrenadas()
	_obtenerRasgos()

func _obtenerRasgos():
	for indice in claseSeleccionada.size():
		if claseSeleccionada.has("Nombre " + str(indice)) and claseSeleccionada["Nombre " + str(indice)] != "":
			rasgos[str(indice)] = claseSeleccionada["Rasgo " + str(indice)]

func _obtenerHabilidadesEntrenadas():
	var stringHabilidades : String = claseSeleccionada["Habilidades Entrenadas"]
	habilidadesEntrenadas = stringHabilidades.split(",")

func obtenerClase(nombreClase):
	if diccionarioClases.has(nombreClase):
		nombre = nombreClase
		claseSeleccionada = diccionarioClases.get(nombreClase)
		if diccionarioClases.is_empty() or diccionarioClases == null:
			diccionarioClases = _read_json()
		_aplicarClase()

func iterarClases(indice):
	var llaves = diccionarioClases.keys()
	var nombreClase = llaves[indice]
	if diccionarioClases.is_empty() or diccionarioClases == null:
		diccionarioClases = _read_json()
	obtenerClase(nombreClase)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioClases = json_object.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor

