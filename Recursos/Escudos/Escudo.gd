extends Resource
class_name Escudo

@export var directorioJSON : String
var diccionarioEscudos : Dictionary
var escudoSeleccionada : Dictionary
var nombre : String
var bonificador : int
var bonificadorMinimo : int
var pruebaHabilidad : int
var velocidad : int
var precio : String
var peso : String

func _aplicarEscudo():
	bonificador = escudoSeleccionada["Bonificador"]
	bonificadorMinimo = escudoSeleccionada["Bon. Minimo Mejora"]
	pruebaHabilidad = escudoSeleccionada["Prueba"]
	velocidad = escudoSeleccionada["Velocidad"]
	precio = str(escudoSeleccionada["Precio"])
	peso = escudoSeleccionada["Peso"]

func obtenerEscudo(nombreEscudo):
	if diccionarioEscudos.has(nombreEscudo):
		if diccionarioEscudos.is_empty() or diccionarioEscudos == null:
			diccionarioEscudos = _read_json()
		nombre = nombreEscudo
		escudoSeleccionada = diccionarioEscudos.get(nombreEscudo)
		_aplicarEscudo()
	else: return null

func iterarEscudos(indice):
	if diccionarioEscudos.is_empty() or diccionarioEscudos == null:
		diccionarioEscudos = _read_json()
	var llaves = diccionarioEscudos.keys()
	var nombreEscudo = llaves[indice]
	obtenerEscudo(nombreEscudo)

func _read_json():
	var f = FileAccess.open(directorioJSON,FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(f.get_as_text())
	diccionarioEscudos = json_object.get_data()

func _dividirString(string : String):
	var diccionario : Dictionary
	var habilidadValorArray = string.split(",")
	for habValor in habilidadValorArray:
		var array = habValor.split(" ")
		diccionario[array[0]] = int(array[1])
	return diccionario
	#TODO: Dividir las habilidades por nombre y valor

