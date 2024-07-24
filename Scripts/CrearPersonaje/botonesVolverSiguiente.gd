extends HBoxContainer
class_name botonesVolverSiguiente

@export var escenaVolver : PackedScene
@export var escenaSiguiente : PackedScene

func _on_volver_pressed():
	get_tree().change_scene_to_packed(escenaVolver)


func _on_siguiente_pressed():
	get_tree().change_scene_to_packed(escenaSiguiente)
