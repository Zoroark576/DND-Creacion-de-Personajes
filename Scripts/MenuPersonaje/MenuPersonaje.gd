extends Control
var verLore = preload("res://Escenas/VerPersonaje/VerLore.tscn")
var verHabDefensas = preload("res://Escenas/VerPersonaje/VerHabilidadesYDefensas.tscn")
var verEquipamiento = preload("res://Escenas/VerPersonaje/VerEquipamiento.tscn")
var verPoderes = preload("res://Escenas/VerPersonaje/VerPoderes.tscn")
var menuPersonajes = preload("res://Escenas/MenuPrincipal/menu_principal.tscn")
var menuBatalla = preload("res://Escenas/MenuPersonaje/BatallaPersonaje.tscn")

func _ready():
	asignarDatos()

func _on_b_ver_lore_pressed():
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
	get_tree().change_scene_to_packed(menuPersonajes)

func _on_batalla_pressed():
	get_tree().change_scene_to_packed(menuBatalla)
