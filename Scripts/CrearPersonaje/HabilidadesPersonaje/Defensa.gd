extends PanelContainer
class_name botonDefensa
@export var lineaValor : LineEdit
@export var nodoBonus : SpinBox
var valorDefensa = 0:
	set(valor):
		valorDefensa = valor
		lineaValor.text = str(valorDefensa)
var valorBonus : int = 0

func asignarValor(valor):
	valorDefensa = valor

func setBonus(esVisible : bool,valor):
	valorBonus = valor
	nodoBonus.visible = esVisible
	nodoBonus.text = "+" + str(valor)

func _on_bonus_value_changed(value):
	valorBonus = value
	lineaValor.text = str(valorDefensa + valorBonus)
