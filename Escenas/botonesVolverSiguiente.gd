extends botonesVolverSiguiente
@export var oro : SpinBox
@export var armadura : OptionButton
@export var mano1 : OptionButton
@export var mano2 : OptionButton
@export var inventario : TextEdit
@export var nPArmadura : CheckBox
@export var nPMano1 : CheckBox
@export var nPMano2 : CheckBox
@export var nEMano1 : OptionButton
@export var nEMano2 : OptionButton

func _on_siguiente_pressed():
	super()
	Personaje.oro = oro.value
	Personaje.armadura = armadura.get_item_text(armadura.get_selected_id())
	Personaje.armaduraProficiente = nPArmadura.button_pressed
	Personaje.primeraMano = mano1.get_item_text(mano1.get_selected_id())
	Personaje.primeraManoProficiente = nPMano1.button_pressed
	Personaje.primeraManoEstadistica = nEMano1.get_item_text(nEMano1.get_item_index(nEMano1.get_selected_id()))
	Personaje.segundaMano = mano2.get_item_text(mano2.get_selected_id())
	Personaje.segundaManoProficiente = nPMano2.button_pressed
	Personaje.segundaManoEstadistica = nEMano2.get_item_text(nEMano2.get_item_index(nEMano2.get_selected_id()))
	Personaje.inventario = inventario.text
