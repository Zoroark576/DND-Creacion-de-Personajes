extends Control
var menuPrincipal = load("res://Escenas/MenuPrincipal/menu_principal.tscn")
var siguienteMenu = load("res://Escenas/CrearPersonaje/EstadisticasPersonaje.tscn")
@export var contenedorInputs : GridContainer
@export var opcionesRaza : OptionButton
@export var opcionesClase : OptionButton
var recursoRaza = load("res://Recursos/Razas/Raza.tres")

@export_group("Opciones Que Afecta La Raza")
@export var tamaño : LineEdit
@export var lenguajes : LineEdit
@export var vision : LineEdit


func _ready():
	recursoRaza._read_json()

func _on_volver_pressed():
	get_tree().change_scene_to_packed(menuPrincipal)

func _on_boton_opcion_item_selected(index):
	var nombreRaza = opcionesRaza.get_item_text(index)
	recursoRaza.obtenerRaza(nombreRaza)
	tamaño.text = recursoRaza.razaSeleccionada["Tamaño"]
	vision.text = recursoRaza.razaSeleccionada["Visión"]
	lenguajes.text = recursoRaza.razaSeleccionada["Idiomas"]



