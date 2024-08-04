extends Control
@export var contVida : HBoxContainer
@export var contDatosBatalla : HBoxContainer
@export var contOtrosDatosBatalla : GridContainer

var verHabilidades = preload("res://Escenas/VerPersonaje/VerHabilidadesYDefensas(Batalla).tscn")
var verPoderes = preload("res://Escenas/VerPersonaje/VerPoderes(Batalla).tscn")
var verInventario = preload("res://Escenas/VerPersonaje/VerEquipamiento(Batalla).tscn")

func _on_habilidades_pressed():
	guardarValores()
	get_tree().change_scene_to_packed(verHabilidades)

func _on_poderes_y_feats_pressed():
	guardarValores()
	get_tree().change_scene_to_packed(verPoderes)

func _on_inventario_pressed():
	guardarValores()
	get_tree().change_scene_to_packed(verInventario)

func guardarValores():
	contVida.guardarValores()
	contDatosBatalla.guardarValores()
	contOtrosDatosBatalla.guardarValores()
