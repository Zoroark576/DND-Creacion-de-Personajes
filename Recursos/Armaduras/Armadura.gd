extends Resource
class_name Armadura

@export var directorioJSON : String
var diccionarioArmaduras : Dictionary
var armaduraSeleccionada : Dictionary
var nombre : String
var tipoArmadura : String
var bonificador : int
var bonificadorMinimo : int
var pruebaHabilidad : int
var velocidad : int
var precio : int
var peso : float




func _aplicarArmadura():
	tipoArmadura = armaduraSeleccionada["Tipo de Armadura"]
	bonificador = armaduraSeleccionada["Bonificador"]
	bonificadorMinimo = armaduraSeleccionada["Bon. Minimo Mejora"]
	pruebaHabilidad = armaduraSeleccionada["Prueba"]
	velocidad = armaduraSeleccionada["Velocidad"]
	precio = armaduraSeleccionada["Precio"]
	peso = armaduraSeleccionada["Peso"]

func obtenerArmadura(nombreArmadura):
	if diccionarioArmaduras.has(nombreArmadura):
		if diccionarioArmaduras.is_empty() or diccionarioArmaduras == null:
			diccionarioArmaduras = _read_json()
		nombre = nombreArmadura
		armaduraSeleccionada = diccionarioArmaduras.get(nombreArmadura)
		_aplicarArmadura()
	else: 
		valoresDefault()

func valoresDefault():
	nombre = "Ninguno"
	tipoArmadura = "L"
	bonificador = 0
	bonificadorMinimo = 0
	pruebaHabilidad = 0
	velocidad = 0
	precio = 0
	peso = 0

func iterarArmaduras(indice):
	if diccionarioArmaduras.is_empty() or diccionarioArmaduras == null:
		diccionarioArmaduras = _read_json()
	var llaves = diccionarioArmaduras.keys()
	var nombreArmadura = llaves[indice]
	obtenerArmadura(nombreArmadura)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioArmaduras = json_object.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor

