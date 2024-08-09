extends PanelContainer
class_name botonDefensa
@export var lineaValor : LineEdit
@export var nodoBonus : SpinBox
@export var nModAsociado : OptionButton
signal cambioMod
var modAsociado = "No"
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

func _on_mod_item_selected(index):
	modAsociado = nModAsociado.get_item_text(nModAsociado.get_item_index(nModAsociado.get_selected_id()))
	cambioMod.emit(modAsociado)
