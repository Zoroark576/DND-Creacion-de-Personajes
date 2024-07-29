extends HBoxContainer

@export_group("Defensas")
@export var aC : PanelContainer
@export var fortaleza : PanelContainer
@export var reflejos : PanelContainer
@export var voluntad : PanelContainer

var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")
var recursoEscudo : Escudo = preload("res://Recursos/Escudos/Escudo.tres")
var recursoClase : Clase = preload("res://Recursos/Clases/Clase.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	recursoClase.obtenerClase(Personaje.nombreClase)
	var bonificacionArmadura
	var bonificacionEscudo 
	bonificacionArmadura = obtenerBonificadoresArmadura()
	bonificacionEscudo = obtenerBonificadoresEscudo()
	var bonificacionTotal = bonificacionArmadura + bonificacionEscudo
	calcularAC(bonificacionTotal)
	calcularFortaleza()
	calcularReflejos(bonificacionEscudo)
	calcularVoluntad()

func obtenerBonificadoresArmadura():
	recursoArmadura._read_json()
	if Personaje.armadura != "Ninguno":
		recursoArmadura.obtenerArmadura(Personaje.armadura)
		return recursoArmadura.bonificador
	else:
		return 0
	

func obtenerBonificadoresEscudo():
	recursoEscudo._read_json()
	if Personaje.segundaMano.contains("Escudo"):
		recursoEscudo.obtenerEscudo(Personaje.segundaMano)
		return recursoEscudo.bonificador
	else:
		return 0

func calcularAC(bonus):
	var acValor = 10 + floor(Personaje.nivel/2)
	acValor += bonus
	var modDex = floor((Personaje.estadisticas["DEX"] - 10)/2)
	var modCon = floor((Personaje.estadisticas["CON"] - 10)/2)
	if recursoArmadura.tipoArmadura == "L":
		acValor += compararValores(modDex,modCon)
	aC.asignarValor(acValor)

func calcularFortaleza():
	var modFue = floor((Personaje.estadisticas["STR"] - 10)/2)
	var modCon = floor((Personaje.estadisticas["CON"] - 10)/2)
	var fortValor = 10 + floor(Personaje.nivel/2)
	fortValor += (compararValores(modFue,modCon))
	if recursoClase.defensas.has("Fortaleza"):
		fortValor += recursoClase.defensas.get("Fortaleza")
	
	
	fortaleza.asignarValor(fortValor)

func calcularReflejos(bonusEscudo):
	var reflValor = 10 + floor(Personaje.nivel/2)
	var modDex = floor((Personaje.estadisticas["DEX"] - 10)/2)
	var modInt = floor((Personaje.estadisticas["INT"] - 10)/2)
	reflValor += bonusEscudo + compararValores(modDex,modInt)
	if recursoClase.defensas.has("Reflejos"):
		reflValor += recursoClase.defensas.get("Reflejos")
	reflejos.asignarValor(reflValor)

func calcularVoluntad():
	var volValor = 10 + floor(Personaje.nivel/2)
	var modSab = floor((Personaje.estadisticas["WIS"] - 10)/2)
	var modCar = floor((Personaje.estadisticas["CHA"] - 10)/2)
	volValor += compararValores(modSab,modCar)
	if recursoClase.defensas.has("Voluntad"):
		volValor += recursoClase.defensas.get("Voluntad")
	voluntad.asignarValor(volValor)

func compararValores(valor1,valor2):
	if valor1 >= valor2:
		return valor1
	else:
		return valor2
		
#TODO Termianr calculo de defensas tomando en cuenta los valores de las habilidades
