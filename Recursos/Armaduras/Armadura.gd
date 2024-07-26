extends Resource
class_name Armadura

@export var directorioJSON : String
var diccionarioArmaduras : Dictionary
var armaduraSeleccionada : Dictionary
var nombre : String
var bonificador : int
var bonificadorMinimo : int
var pruebaHabilidad : int
var velocidad : int
var precio : String
var peso : String




func _aplicarArmadura():
	bonificador = armaduraSeleccionada["Bonificador"]
	bonificadorMinimo = armaduraSeleccionada["Bon. Minimo Mejora"]
	pruebaHabilidad = armaduraSeleccionada["Prueba"]
	velocidad = armaduraSeleccionada["Velocidad"]
	precio = str(armaduraSeleccionada["Precio"])
	peso = armaduraSeleccionada["Peso"]

func obtenerArmadura(nombreArmadura):
	if diccionarioArmaduras.has(nombreArmadura):
		if diccionarioArmaduras.is_empty() or diccionarioArmaduras == null:
			diccionarioArmaduras = _read_json()
		nombre = nombreArmadura
		armaduraSeleccionada = diccionarioArmaduras.get(nombreArmadura)
		_aplicarArmadura()
	else: return null

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

