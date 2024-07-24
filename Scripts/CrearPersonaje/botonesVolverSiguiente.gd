extends HBoxContainer
class_name botonesVolverSiguiente

@export var rutaVolver : String
@export var rutaSiguiente : String

func _on_volver_pressed():
	var escenaVolver = load(rutaVolver)
	get_tree().change_scene_to_packed(escenaVolver)


func _on_siguiente_pressed():
	var escenaSiguiente = load(rutaSiguiente)
	get_tree().change_scene_to_packed(escenaSiguiente)
