extends Control

#Lore
var nombre : String = ""
var nombreRaza : String
var nombreClase : String
var lore : Dictionary
#Estadisticas (STR,DEX,etc.)
var estadisticas : Dictionary = {"STR" : 0,"CON" : 0,"DEX" : 0, "INT" : 0,"WIS" : 0,"CHA" : 0}
var experiencia : int = 0
var nivel : int = 1
var habilidadesEntrenadas = []
var bonusVelocidad : int
#Cosas que guarda el personaje
var inventario : String
var oro : float
var armadura : String
var armaduraProficiente : bool
var primeraMano : String
var primeraManoProficiente : bool
var segundaMano : String
var segundaManoProficiente : bool
var poderes : Dictionary 
var dotes : Dictionary
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
