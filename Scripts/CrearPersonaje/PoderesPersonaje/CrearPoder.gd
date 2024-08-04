extends Control
@export var contAtributos : VBoxContainer
@export var opcionesTipo : OptionButton

@export var checkAfectaDote : CheckBox
@export var efectosDote : HBoxContainer
@export var efectosDote2 : HBoxContainer
@export var nEsPermanente : CheckBox

@export var botonesVolver : HBoxContainer

func asignarVolver(ruta):
	botonesVolver.rutaVolver = ruta
	botonesVolver.rutaSiguiente = ruta

func _on_option_button_2_item_selected(index):
	for atributo in contAtributos.get_children():
		var nombre = atributo.name
		if nombre.contains(opcionesTipo.get_item_text(index)):
			atributo.visible = true
		else:
			atributo.visible = false

func _on_check_box_toggled(toggled_on):
	for efecto in efectosDote.get_children():
		if efecto is BaseButton:
			efecto.disabled = !toggled_on
		if efecto is Range:
			efecto.editable = toggled_on
	for efecto in efectosDote2.get_children():
		if efecto is BaseButton:
			efecto.disabled = !toggled_on
		if efecto is Range:
			efecto.editable = toggled_on
	nEsPermanente.disabled = !toggled_on
