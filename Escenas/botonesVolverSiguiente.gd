extends botonesVolverSiguiente
@export var oro : SpinBox
@export var armadura : OptionButton
@export var mano1 : OptionButton
@export var mano2 : OptionButton
@export var inventario : TextEdit

func _on_siguiente_pressed():
	super()
	Personaje.oro = oro.value
	Personaje.armadura = armadura.get_item_text(armadura.get_selected_id())
	Personaje.primeraMano = mano1.get_item_text(mano1.get_selected_id())
	Personaje.segundaMano = mano2.get_item_text(mano2.get_selected_id())
	Personaje.inventario = inventario.text
