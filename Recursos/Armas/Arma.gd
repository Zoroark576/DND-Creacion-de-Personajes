extends Resource
class_name Arma

@export var directorioJSON : String
@export var directorioJSON2 : String
@export var directorioJSON3 : String
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
	else: 
		valoresDefault()

func valoresDefault():
	nombre = "Sin Arma"
	competencia = 0
	manos = 1 
	rango = "null"
	daño = "1 D4"
	alcance = "null"
	precio = 0
	peso = 0
	grupo = "null"
	propiedades = "null"

func iterarArmas(indice):
	if diccionarioArmas.is_empty() or diccionarioArmas == null:
		diccionarioArmas = _read_json()
	var llaves = diccionarioArmas.keys()
	var nombreArma = llaves[indice]
	obtenerArma(nombreArma)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioArmas = json_object.get_data()
	
	var f2 = FileAccess.open(directorioJSON2,FileAccess.READ)
	var json_object2 = JSON.new()
	var parse_err2 = json_object2.parse(f2.get_as_text())
	var diccionario2 = json_object2.get_data()
	diccionarioArmas.merge(diccionario2)
	
	var f3 = FileAccess.open(directorioJSON3,FileAccess.READ)
	var json_object3 = JSON.new()
	var parse_err3 = json_object3.parse(f3.get_as_text())
	var diccionario3 = json_object3.get_data()
	diccionarioArmas.merge(diccionario3)

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor

