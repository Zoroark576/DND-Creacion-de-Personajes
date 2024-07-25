extends GridContainer

@export var recursoArmas : Arma
@export var recursoArmadura : Arma
@export var nArmaduras : OptionButton
@export var nMano1 : OptionButton
@export var nMano2 : OptionButton

func _ready():
	recursoArmas._read_json()
	nArmaduras.add_item("Ninguno")
	nMano1.add_item("Ninguno")
	nMano2.add_item("Ninguno")
	for indice in recursoArmas.diccionarioArmas.size():
		recursoArmas.iterarArmas(indice)
		nMano1.add_item(recursoArmas.nombre)
		nMano2.add_item(recursoArmas.nombre)


func _on_a_input_2_item_selected(index):
	itemDosManos(nMano1.get_item_text(index),index)

func _on_a_input_3_item_selected(index):
	itemDosManos(nMano2.get_item_text(index),index)

func itemDosManos(nombre,index):
	recursoArmas.obtenerArma(nombre)
	if recursoArmas.manos == 2:
		nMano1.select(index)
		nMano2.select(index)
		nMano2.disabled = true
	else:
		nMano2.disabled = false
		recursoArmas.obtenerArma(nMano1.get_item_text(nMano1.get_selected_id()))
		if recursoArmas.manos == 2:
			nMano1.select(nMano2.get_selected_id())
		recursoArmas.obtenerArma(nMano2.get_item_text(nMano2.get_selected_id()))
		if recursoArmas.manos == 2:
			nMano2.select(nMano1.get_selected_id())
