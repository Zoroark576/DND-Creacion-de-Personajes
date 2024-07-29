extends PanelContainer
class_name botonHabilidad

@export var checkEntrenado : CheckButton
@export var valorHabilidadLinea : LineEdit
@export var nombreHabilidad : Label
@export var nodoBonus : CheckBox
var valorBonus : int = 2


var modificadorAsociado : String

signal estaEntrenado
signal bonusAnyActivado

var valorHabilidad = 0:
	set(valor):
		valorHabilidad = valor
		valorHabilidadLinea.text = str(valorHabilidad)


func setValue(valor : int,puedeEntrenar : bool):
	valorHabilidad = valor
	checkEntrenado.disabled = !puedeEntrenar
	var nuevoStyleBox = get_theme_stylebox("panel").duplicate()
	if puedeEntrenar:
		nuevoStyleBox.set("border_color",Color.PALE_VIOLET_RED)
	else:
		nuevoStyleBox.set("border_color",Color.DARK_RED)
	add_theme_stylebox_override("panel",nuevoStyleBox)

func setNombre(nombre,caracteristicaAsociada):
	nombreHabilidad.text = nombre
	modificadorAsociado = caracteristicaAsociada

func setBonus(esVisible : bool,valor):
	valorBonus = valor
	nodoBonus.visible = esVisible
	nodoBonus.text = "+" + str(valor)

func obtenerNombreCorto():
	return nombreHabilidad.text.substr(0,4)

func _on_check_entrenado_toggled(toggled_on):
	if toggled_on:
		valorHabilidad += 5
	else:
		valorHabilidad -=5
	estaEntrenado.emit(toggled_on,obtenerNombreCorto())


func _on_bonus_toggled(toggled_on):
	if toggled_on:
		valorHabilidad += valorBonus
	else:
		valorHabilidad -= valorBonus
	bonusAnyActivado.emit(toggled_on)
