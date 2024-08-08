extends Control
var verLore = load("res://Escenas/VerPersonaje/VerLore.tscn")
var verHabDefensas = load("res://Escenas/VerPersonaje/VerHabilidadesYDefensas.tscn")
var verEquipamiento = load("res://Escenas/VerPersonaje/VerEquipamiento.tscn")
var verPoderes = load("res://Escenas/VerPersonaje/VerPoderes.tscn")
var menuPersonajes = load("res://Escenas/MenuPrincipal/menu_principal.tscn")
var menuBatalla = load("res://Escenas/MenuPersonaje/BatallaPersonaje.tscn")
var subirEstadisticas = load("res://Escenas/MenuPrincipal/EditarEstadisticas.tscn")
var menuNotas = load("res://Escenas/MenuPersonaje/Notas/Notas.tscn")

var recursoGuardar : guardarPersonaje = load("res://Recursos/guardarCargarPersonaje.tres")

@export var nNombre : Label
func _ready():
	nNombre.text = Personaje.nombre
	asignarDatos()

func _on_b_ver_lore_pressed():
	print("LOre presionado")
	get_tree().change_scene_to_packed(verLore)

@export var nXP : SpinBox
@export var nNivel : SpinBox
@export var nAP : SpinBox

func asignarDatos():
	nXP.value = Personaje.experiencia
	nNivel.value = Personaje.nivel
	nAP.value = Personaje.actionPoints

func _on_habilidades_pressed():
	get_tree().change_scene_to_packed(verHabDefensas)

func _on_inventario_pressed():
	get_tree().change_scene_to_packed(verEquipamiento)

func _on_poderes_pressed():
	get_tree().change_scene_to_packed(verPoderes)

func _on_button_pressed():
	recursoGuardar.guardarPersonaje()
	get_tree().change_scene_to_packed(menuPersonajes)

func _on_batalla_pressed():
	get_tree().change_scene_to_packed(menuBatalla)

func _on_subir_estadisticas_pressed():
	get_tree().change_scene_to_packed(subirEstadisticas)

func _on_notas_pressed():
	get_tree().change_scene_to_packed(menuNotas)
