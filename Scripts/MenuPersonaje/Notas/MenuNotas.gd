extends Control

@export var nTitulo : LineEdit
@export var nFecha : LineEdit
@export var nContenido : TextEdit
@export var nAccept : ConfirmationDialog
@export var contNotas : VBoxContainer
var eBotonNota = preload("res://Escenas/MenuPersonaje/Notas/BotonNota.tscn")
var eCrearNota = load("res://Escenas/MenuPersonaje/Notas/CrearNota.tscn")
var eMenuPersonaje = load("res://Escenas/MenuPersonaje/MenuPersonaje.tscn")
var tituloCargado
func _ready():
	cargarNotas()

func cargarNotas():
	for child in contNotas.get_children():
		contNotas.remove_child(child)
		child.queue_free()
	for titulo in Personaje.notas:
		var nuevoBoton : botonNota = eBotonNota.instantiate()
		nuevoBoton.crearBoton(titulo)
		nuevoBoton.cargarNota.connect(notaCargada)
		contNotas.add_child(nuevoBoton)

func notaCargada(titulo):
	var nota = Personaje.notas.get(titulo)
	tituloCargado = titulo
	nTitulo.text = tituloCargado
	nFecha.text = nota.get("Fecha")
	nContenido.text = nota.get("Contenido")

func _on_crear_nota_pressed():
	get_tree().change_scene_to_packed(eCrearNota)

func _on_borrar_nota_pressed():
	if tituloCargado.is_empty() != true:
		nAccept.visible = true

func _on_confirmation_dialog_confirmed():
	Personaje.notas.erase(nTitulo.text)
	cargarNotas()

func _on_button_pressed():
	get_tree().change_scene_to_packed(eMenuPersonaje)
