extends Resource
class_name Arma

@export var directorioJSON : String
var diccionarioArmas : Dictionary
var armaSeleccionada : Dictionary
var nombre : String
var competencia : int
var manos : int
var rango : String
var daño : String
var alcance : String
var precio : float
var peso : float
var grupo : String
var propiedades : String

func _ready():
	diccionarioArmas = _read_json()

func _aplicarArma():
	competencia = armaSeleccionada["Competencia"]
	manos = armaSeleccionada["Manos"]
	rango = armaSeleccionada["Rango"]
	daño = armaSeleccionada["Daño"]
	alcance = armaSeleccionada["Alcance"]
	precio = armaSeleccionada["Precio"]
	peso = armaSeleccionada["Peso"]
	grupo = armaSeleccionada["Grupo"]
	propiedades = armaSeleccionada["Propiedades"]


func obtenerArma(nombreArma):
	if diccionarioArmas.has(nombreArma):
		nombre = nombreArma
		armaSeleccionada = diccionarioArmas.get(nombreArma)
		if diccionarioArmas.is_empty() or diccionarioArmas == null:
			diccionarioArmas = _read_json()
		_aplicarArma()

func iterarArmas(indice):
	var llaves = diccionarioArmas.keys()
	var nombreArma = llaves[indice]
	if diccionarioArmas.is_empty() or diccionarioArmas == null:
		diccionarioArmas = _read_json()
	obtenerArma(nombreArma)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioArmas = json_object.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor

