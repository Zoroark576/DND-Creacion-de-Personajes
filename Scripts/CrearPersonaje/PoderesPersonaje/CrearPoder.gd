extends Control
@export var contAtributos : VBoxContainer
@export var opcionesTipo : OptionButton

@export var checkAfectaDote : CheckBox
@export var efectosDote : HBoxContainer
@export var efectosDote2 : HBoxContainer
@export var nLEsPermanente : Label
@export var nEsPermanente : CheckBox
@export var nLEfectos : Label
@export var nLEfectos2 : Label

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
	nLEfectos.visible = toggled_on
	nLEfectos2.visible = toggled_on
	efectosDote.visible = toggled_on
	efectosDote2.visible = toggled_on
	nLEsPermanente.visible = toggled_on
	nEsPermanente.visible = toggled_on
	
func _on_botones_eliminar_escena():
	get_tree().root.remove_child(self)
	self.queue_free()
