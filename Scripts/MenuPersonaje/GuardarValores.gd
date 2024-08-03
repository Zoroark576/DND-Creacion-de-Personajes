extends Control


func _on_sxp_value_changed(value):
	Personaje.experiencia = value


func _on_s_nivel_value_changed(value):
	Personaje.nivel = value


func _on_sap_value_changed(value):
	Personaje.actionPoints = value
