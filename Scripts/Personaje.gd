extends Control

#Lore
var nombre : String
var lore : Dictionary
#Estadisticas (STR,DEX,etc.)
var estadisticas : Dictionary = {"STR" : 0,"CON" : 0,"DEX" : 0, "INT" : 0,"WIS" : 0,"CHA" : 0}
var habilidades : Dictionary
var defensas : Dictionary = {"AC" : 0, "CON" : 0,"REF" : 0, "VOL" : 0}
var sentidosPasivos : Dictionary = {"Percepcion" : 0, "Perspicacia" : 0}
var velocidad : int
var iniciativa : int
#Cosas que guarda el personaje
var inventario : Dictionary
var poderes : Dictionary
var feats : Dictionary
var notas : Dictionary
var familiar 
#Batalla
var vidaTemp : int
var urgTemp : int
##Defensas Temporales
var defensasTemporales : Dictionary
var condicionesYEfectos : String
var deathSaves : int
var seUsoDeathSave : String
