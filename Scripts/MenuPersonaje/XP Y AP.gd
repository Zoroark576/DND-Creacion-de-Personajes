extends HBoxContainer

@export var nXp : SpinBox
@export var nNivel : SpinBox


func _on_sxp_value_changed(value):
	for nivelXP in VariablesGlobales.ExperienciaNiveles:
		if value >= nivelXP:
			Personaje.experiencia = value
			Personaje.nivel = VariablesGlobales.ExperienciaNiveles.get(nivelXP)
			nNivel.value = Personaje.nivel
