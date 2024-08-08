extends Control

var recursoGuardado = preload("res://Recursos/guardarCargarPersonaje.tres")

#Lore
var id : int = 0
var nombre : String = " "
var nombreRaza : String
var nombreClase : String
var lore : Dictionary
#Estadisticas (STR,DEX,etc.)
var estadisticas : Dictionary = {"STR" : 0,"CON" : 0,"DEX" : 0, "INT" : 0,"WIS" : 0,"CHA" : 0}
var experiencia : int = 0
var nivel : int = 1
var habilidadesEntrenadas = []
var habilidadesConBonus = []
var bonusVelocidad : int
#Cosas que guarda el personaje
var inventario : String
var oro : float
var armadura : String = "Ninguno"
var armaduraProficiente : bool
var primeraMano : String = "Ninguno"
var primeraManoProficiente : bool
var segundaMano : String = "Ninguno"
var segundaManoProficiente : bool
var poderes : Dictionary 
var dotes : Dictionary
var rituales : Dictionary
var rasgosDeClase : Dictionary
var notas : Dictionary
var familiar : Dictionary
#Batalla
var vidaTemp : int = -1000
var urgTemp : int = -1000
##Defensas Temporales
var defensasTemporales : Dictionary
var condicionesYEfectos : String = ""
var deathSaves : int = 0
var deathSaveMod = 0
var seUso2ndoViento : String = "No"
var resistencias : String = ""
var actionPoints : int = 1
var inspiracion : int = 0

func resetearValores():
	id = 0
	nombre = ""
	nombreRaza = ""
	nombreClase = ""
	lore = {}
	#Estadisticas (STR,DEX,etc.)
	estadisticas = {"STR" : 0,"CON" : 0,"DEX" : 0, "INT" : 0,"WIS" : 0,"CHA" : 0}
	experiencia = 0
	nivel = 1
	habilidadesEntrenadas = []
	habilidadesConBonus = []
	bonusVelocidad = 0
	#Cosas que guarda el personaje
	inventario = ""
	oro = 0
	armadura = ""
	armaduraProficiente = false
	primeraMano = ""
	primeraManoProficiente = false
	segundaMano = ""
	segundaManoProficiente = false
	poderes = {} 
	dotes = {}
	rituales = {}
	rasgosDeClase = {}
	notas = {}
	familiar = {}
	#Batalla
	vidaTemp = -1000
	urgTemp = -1000
	##Defensas Temporales
	defensasTemporales = {}
	condicionesYEfectos = ""
	deathSaves = 0
	deathSaveMod = 0
	seUso2ndoViento = "No"
	resistencias = ""
	actionPoints = 1
	inspiracion = 0

func _ready():
	get_tree().auto_accept_quit = false

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if !nombre.is_empty():
			recursoGuardado.guardarPersonaje()
		get_tree().quit()
