extends GridContainer
@export var contArmadura : HBoxContainer
@export var contMano1 : HBoxContainer
@export var contMano2 : HBoxContainer

var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")
var recursoArma : Arma = preload("res://Recursos/Armas/Arma.tres")

func _ready():
	recursoArmadura._read_json()
	recursoArma._read_json()

func _on_a_input_item_selected(index):
	pass # Replace with function body.


func _on_a_input_2_item_selected(index):
	pass # Replace with function body.


func _on_a_input_3_item_selected(index):
	pass # Replace with function body.
