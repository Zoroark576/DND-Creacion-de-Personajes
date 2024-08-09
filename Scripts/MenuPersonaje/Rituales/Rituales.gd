extends Control

@export var nTitulo : LineEdit
@export var nNivel : SpinBox
@export var nTiempo : LineEdit
@export var nCoste : LineEdit
@export var nHabilidadClave : LineEdit
@export var nDominado : CheckBox
@export var nTextoFlorido : TextEdit
@export var nContenido : TextEdit
@export var nAccept : ConfirmationDialog
@export var nContRituales : VBoxContainer
var eCrearRitual = load("res://Escenas/MenuPersonaje/Rituales/CrearRitual.tscn")
var eBotonRitual = load("res://Escenas/MenuPersonaje/Rituales/BotonRitual.tscn")
var eMenuPersonaje = load("res://Escenas/MenuPersonaje/MenuPersonaje.tscn")
var tituloCargado = ""

func _ready():
	
	cargarRituales()

func cargarRituales():
	for child in nContRituales.get_children():
		nContRituales.remove_child(child)
		child.queue_free()
	for titulo in Personaje.rituales:
		var nuevoBoton : botonRitual = eBotonRitual.instantiate()
		nuevoBoton.crearBoton(titulo)
		nuevoBoton.cargarRitual.connect(ritualCargado)
		nContRituales.add_child(nuevoBoton)

func ritualCargado(titulo):
	nDominado.disabled = false
	var ritual = Personaje.rituales[titulo]
	nTitulo.text = titulo
	nNivel.value = int(ritual["Nivel"])
	nTiempo.text = ritual["Tiempo"]
	nCoste.text = ritual["Costo"]
	nHabilidadClave.text = ritual["Habilidad Clave"]
	nDominado.button_pressed = ritual["Dominado"]
	nTextoFlorido.text = ritual["Texto Florido"]
	nContenido.text = ritual["Contenido"]
	tituloCargado = titulo

func _on_dominado_toggled(toggled_on):
	if !tituloCargado.is_empty():
		Personaje.rituales[tituloCargado]["Dominado"] = toggled_on 


func _on_crear_ritual_pressed():
	get_tree().change_scene_to_packed(eCrearRitual)

func _on_borrar_ritual_pressed():
	nAccept.visible = true

func _on_confirmation_dialog_confirmed():
	Personaje.rituales.erase(tituloCargado)
	cargarRituales()

func _on_button_pressed():
	get_tree().change_scene_to_packed(eMenuPersonaje)
