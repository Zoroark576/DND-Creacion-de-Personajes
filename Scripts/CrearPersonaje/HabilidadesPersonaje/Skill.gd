extends PanelContainer
class_name botonHabilidad

@export var checkEntrenado : CheckButton
@export var valorHabilidadLinea : LineEdit
@export var nombreHabilidad : Label
@export var modificadorAsociado : String

signal estaEntrenado

var valorHabilidad = 0:
	set(valor):
		valorHabilidad = valor
		valorHabilidadLinea.text = str(valorHabilidad)


func setValue(valor : int,puedeEntrenar : bool):
	valorHabilidad = valor
	checkEntrenado.disabled = puedeEntrenar
	var nuevoStyleBox = get_theme_stylebox("panel").duplicate()
	if !puedeEntrenar:
		nuevoStyleBox.set("border_color",Color.PALE_VIOLET_RED)
	else:
		nuevoStyleBox.set("border_color",Color.DARK_RED)
	add_theme_stylebox_override("panel",nuevoStyleBox)

func obtenerNombreCorto():
	return nombreHabilidad.text.substr(0,4)

func _on_check_entrenado_toggled(toggled_on):
	if toggled_on:
		valorHabilidad += 5
	else:
		valorHabilidad -=5
	estaEntrenado.emit(toggled_on)
