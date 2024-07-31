extends Control
@export var contAtributos : VBoxContainer
@export var opcionesTipo : OptionButton

func _on_option_button_2_item_selected(index):
	for atributo in contAtributos.get_children():
		if atributo.name == opcionesTipo.get_item_text(index):
			atributo.visible = true
		else:
			atributo.visible = false
