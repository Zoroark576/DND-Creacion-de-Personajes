extends Control
var menuPrincipal = preload("res://Escenas/MenuPrincipal/menu_principal.tscn")
@export var contenedorInputs : GridContainer
@export var opcionesRaza : OptionButton
@export var opcionesClase : OptionButton
@export var recursoRaza : Raza

@export_group("Opciones Que Afecta La Raza")
@export var tamaño : LineEdit
@export var lenguajes : LineEdit
@export var vision : LineEdit


func _ready():
	recursoRaza._read_json()

func _on_volver_pressed():
	get_tree().change_scene_to_packed(menuPrincipal)

func _on_siguiente_pressed():
	for input in contenedorInputs.get_children():
		var valor
		if input is LineEdit or input is TextEdit:
			valor = input.text
		elif input is SpinBox:
			valor = input.value
		elif input is OptionButton:
			valor = input.get_item_text(input.get_selected_id())
		Personaje.lore[input.name] = valor

func _on_boton_opcion_item_selected(index):
	var nombreRaza = opcionesRaza.get_item_text(index)
	recursoRaza.obtenerRaza(nombreRaza)
	tamaño.text = recursoRaza.razaSeleccionada["Tamaño"]
	vision.text = recursoRaza.razaSeleccionada["Visión"]
	lenguajes.text = recursoRaza.razaSeleccionada["Idiomas"]
