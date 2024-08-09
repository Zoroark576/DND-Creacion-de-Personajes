extends Resource
class_name guardarPersonaje
var archivos = []

func guardarPersonaje():
	var archivoConfig = ConfigFile.new()
	if !Personaje.nombre.is_empty():
		var nombre = Personaje.nombre + ","+Personaje.nombreClase+","+Personaje.nombreRaza+","+str(Personaje.id)
		archivoConfig.set_value(nombre,"Nombre",Personaje.nombre)
		archivoConfig.set_value(nombre,"ID",Personaje.id)
		archivoConfig.set_value(nombre,"Clase",Personaje.nombreClase)
		archivoConfig.set_value(nombre,"Raza",Personaje.nombreRaza)
		archivoConfig.set_value(nombre,"Lore",Personaje.lore)
		archivoConfig.set_value(nombre,"Estadisticas",Personaje.estadisticas)
		archivoConfig.set_value(nombre,"Experiencia",Personaje.experiencia)
		archivoConfig.set_value(nombre,"Nivel",Personaje.nivel)
		archivoConfig.set_value(nombre,"Habilidades Entrenadas",Personaje.habilidadesEntrenadas)
		archivoConfig.set_value(nombre,"Habilidades Con Bonus",Personaje.habilidadesConBonus)
		archivoConfig.set_value(nombre,"Bonus Velocidad",Personaje.bonusVelocidad)
		archivoConfig.set_value(nombre,"Inventario",Personaje.inventario)
		archivoConfig.set_value(nombre,"Oro",Personaje.oro)
		archivoConfig.set_value(nombre,"Armadura",Personaje.armadura)
		archivoConfig.set_value(nombre,"Armadura Proficiente",Personaje.armaduraProficiente)
		archivoConfig.set_value(nombre,"Primera Mano",Personaje.primeraMano)
		archivoConfig.set_value(nombre,"Primera Mano Proficiente",Personaje.primeraManoProficiente)
		archivoConfig.set_value(nombre,"Segunda Mano",Personaje.segundaMano)
		archivoConfig.set_value(nombre,"Segunda Mano Proficiente",Personaje.segundaManoProficiente)
		archivoConfig.set_value(nombre,"Poderes",Personaje.poderes)
		archivoConfig.set_value(nombre,"Dotes",Personaje.dotes)
		archivoConfig.set_value(nombre,"Rasgos De Clase",Personaje.rasgosDeClase)
		archivoConfig.set_value(nombre,"Notas",Personaje.notas)
		archivoConfig.set_value(nombre,"Familiar",Personaje.familiar)
		archivoConfig.set_value(nombre,"Vida Temporal",Personaje.vidaTemp)
		archivoConfig.set_value(nombre,"Urgida Temporal",Personaje.urgTemp)
		archivoConfig.set_value(nombre,"Defensas Temporales",Personaje.defensasTemporales)
		archivoConfig.set_value(nombre,"Condiciones y Efectos",Personaje.condicionesYEfectos)
		archivoConfig.set_value(nombre,"Death Saves",Personaje.deathSaves)
		archivoConfig.set_value(nombre,"Death Save Mod",Personaje.deathSaveMod)
		archivoConfig.set_value(nombre,"Se Uso 2ndo Viento",Personaje.seUso2ndoViento)
		archivoConfig.set_value(nombre,"Resistencias",Personaje.resistencias)
		archivoConfig.set_value(nombre,"Action Points",Personaje.actionPoints)
		archivoConfig.set_value(nombre,"Inspiracion",Personaje.inspiracion)
		archivoConfig.set_value(nombre,"Rituales",Personaje.rituales)
		archivoConfig.set_value(nombre,"Notas",Personaje.notas)
		
		var error := archivoConfig.save("user://" + nombre +".ini")
		if error:
			print("An error happened while saving data: ", error)

func cargarPersonaje(rutaArchivo : String):
	var nombre = rutaArchivo.trim_suffix(".ini")
	var archivoConfig = ConfigFile.new()
	var error = archivoConfig.load("user://"+ rutaArchivo)
	if error != OK:
		print(error)
		return error
	Personaje.nombre = archivoConfig.get_value(nombre,"Nombre")
	Personaje.id = archivoConfig.get_value(nombre,"ID")
	Personaje.nombreClase = archivoConfig.get_value(nombre,"Clase")
	Personaje.nombreRaza = archivoConfig.get_value(nombre,"Raza")
	Personaje.lore = archivoConfig.get_value(nombre,"Lore")
	Personaje.estadisticas = archivoConfig.get_value(nombre,"Estadisticas")
	Personaje.experiencia = archivoConfig.get_value(nombre,"Experiencia")
	Personaje.nivel = archivoConfig.get_value(nombre,"Nivel")
	Personaje.habilidadesEntrenadas = archivoConfig.get_value(nombre,"Habilidades Entrenadas")
	Personaje.habilidadesConBonus = archivoConfig.get_value(nombre,"Habilidades Con Bonus")
	Personaje.bonusVelocidad = archivoConfig.get_value(nombre,"Bonus Velocidad")
	Personaje.inventario = archivoConfig.get_value(nombre,"Inventario")
	Personaje.oro = archivoConfig.get_value(nombre,"Oro")
	Personaje.armadura = archivoConfig.get_value(nombre,"Armadura")
	Personaje.armaduraProficiente = archivoConfig.get_value(nombre,"Armadura Proficiente")
	Personaje.primeraMano = archivoConfig.get_value(nombre,"Primera Mano")
	Personaje.primeraManoProficiente = archivoConfig.get_value(nombre,"Primera Mano Proficiente")
	Personaje.segundaMano = archivoConfig.get_value(nombre,"Segunda Mano")
	Personaje.segundaManoProficiente = archivoConfig.get_value(nombre,"Segunda Mano Proficiente")
	Personaje.poderes = archivoConfig.get_value(nombre,"Poderes")
	Personaje.dotes = archivoConfig.get_value(nombre,"Dotes")
	Personaje.rasgosDeClase = archivoConfig.get_value(nombre,"Rasgos De Clase")
	Personaje.notas = archivoConfig.get_value(nombre,"Notas")
	Personaje.familiar = archivoConfig.get_value(nombre,"Familiar")
	Personaje.vidaTemp = archivoConfig.get_value(nombre,"Vida Temporal")
	Personaje.urgTemp = archivoConfig.get_value(nombre,"Urgida Temporal")
	Personaje.defensasTemporales = archivoConfig.get_value(nombre,"Defensas Temporales")
	Personaje.condicionesYEfectos = archivoConfig.get_value(nombre,"Condiciones y Efectos")
	Personaje.deathSaves = archivoConfig.get_value(nombre,"Death Saves")
	Personaje.deathSaveMod = archivoConfig.get_value(nombre,"Death Save Mod")
	Personaje.seUso2ndoViento = archivoConfig.get_value(nombre,"Se Uso 2ndo Viento")
	Personaje.resistencias = archivoConfig.get_value(nombre,"Resistencias")
	Personaje.actionPoints = archivoConfig.get_value(nombre,"Action Points")
	Personaje.inspiracion = archivoConfig.get_value(nombre,"Inspiracion")
	Personaje.rituales = archivoConfig.get_value(nombre,"Rituales")
	Personaje.notas = archivoConfig.get_value(nombre,"Notas")
	return "OK"

func cargarListaDePersonajes():
	var directorio = DirAccess.open("user://")
	archivos = directorio.get_files()
	return archivos
	print(archivos)

func eliminarPersonaje(rutaArchivo : String):
	DirAccess.remove_absolute("user://"+rutaArchivo)
