extends Control
@export var verLore = preload("res://Escenas/VerPersonaje/VerLore.tscn")


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
