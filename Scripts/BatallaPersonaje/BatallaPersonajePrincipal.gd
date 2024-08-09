extends Control
@export var nContVida : HBoxContainer
@export var nContDatosBatalla : HBoxContainer
@export var nContOtrosDatos : GridContainer
var recursoGuardar : guardarPersonaje = load("res://Recursos/guardarCargarPersonaje.tres")

func _ready():
	recursoGuardar.guardarPersonaje()

func reiniciarDatos():
	nContVida.reiniciarValores()
	nContDatosBatalla.reiniciarValores()
	nContOtrosDatos.reiniciarValores()


func _on_r_valores_pressed():
	reiniciarDatos()
