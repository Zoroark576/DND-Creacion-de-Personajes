extends Control
var menuPrincipal = preload("res://Escenas/MenuPrincipal/menu_principal.tscn")
@export var contenedorInputs : VBoxContainer

func _ready():
	pass

func _on_volver_pressed():
	get_tree().change_scene_to_packed(menuPrincipal)

func _on_siguiente_pressed():
	for input in contenedorInputs.get_children():
		var valor
		if input is LineEdit or input is TextEdit:
			valor = input.text
		elif input is SpinBox:
			valor = input.value
		elif input is OptionButton:
			valor = input.get_item_text(input.get_selected_id())
		Personaje.lore[input.name] = valor
