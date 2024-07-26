extends VBoxContainer

@export var contValoresFinales : VBoxContainer

func _process(delta):
	for indice in contValoresFinales.get_child_count():
		var mod : LineEdit = get_child(indice)
		var contador : SpinBox = contValoresFinales.get_child(indice)
		var valor = contador.value
		mod.text = str(floor((valor - 10)/2))
