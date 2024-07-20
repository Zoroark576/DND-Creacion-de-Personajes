extends VBoxContainer

@export var contValores : VBoxContainer
@export var contBonus : VBoxContainer
@export var contInputs : GridContainer

var valor = 0
func _process(delta):
	for index in contInputs.get_child_count():
		if contInputs.get_child(index) is SpinBox:
			valor += contInputs.get_child(index).value
			valor += contBonus.get_child(index/2).value
			contValores.get_child(index/2).value = valor
			valor = 0
