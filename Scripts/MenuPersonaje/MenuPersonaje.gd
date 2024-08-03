extends Control
@export var verLore = preload("res://Escenas/VerPersonaje/VerLore.tscn")
@export var verHabDefensas = preload("res://Escenas/VerPersonaje/VerHabilidadesYDefensas.tscn")
@export var verEquipamiento = preload("res://Escenas/VerPersonaje/VerEquipamiento.tscn")


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
