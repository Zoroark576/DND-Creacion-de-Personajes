extends PanelContainer

@export var lineaValor : LineEdit
@export var nodoBonus : CheckBox
var valorDefensa = 0:
	set(valor):
		valorDefensa = valor
		lineaValor.text = str(valorDefensa)
var valorBonus : int = 2

func asignarValor(valor):
	valorDefensa = valor

func setBonus(esVisible : bool,valor):
	valorBonus = valor
	nodoBonus.visible = esVisible
	nodoBonus.text = "+" + str(valor)


func _on_bonus_toggled(toggled_on):
	if toggled_on:
		valorDefensa += valorBonus
	else:
		valorDefensa -= valorBonus
