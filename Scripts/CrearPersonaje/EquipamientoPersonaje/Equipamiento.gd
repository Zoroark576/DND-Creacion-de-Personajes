extends GridContainer

var recursoArmas : Arma = preload("res://Recursos/Armas/Arma.tres")
var recursoArmadura : Armadura = preload("res://Recursos/Armaduras/Armadura.tres")
var recursoEscudos : Escudo = preload("res://Recursos/Escudos/Escudo.tres")
@export var nArmaduras : OptionButton
@export var nMano1 : OptionButton
@export var nMano2 : OptionButton

func _ready():
	nArmaduras.add_item("Ninguno")
	nMano1.add_item("Ninguno")
	nMano2.add_item("Ninguno")
	recursoArmadura._read_json()
	recursoArmas._read_json()
	recursoEscudos._read_json()
	for indice in recursoArmas.diccionarioArmas.size():
		recursoArmas.iterarArmas(indice)
		nMano1.add_item(recursoArmas.nombre)
		nMano2.add_item(recursoArmas.nombre)
	for indice in recursoEscudos.diccionarioEscudos.size():
		recursoEscudos.iterarEscudos(indice)
		nMano2.add_item(recursoEscudos.nombre)
	for indice in recursoArmadura.diccionarioArmaduras.size():
		recursoArmadura.iterarArmaduras(indice)
		nArmaduras.add_item(recursoArmadura.nombre)


func _on_a_input_2_item_selected(index):
	var texto = nMano2.get_item_text(index)
	itemDosManos(texto,index)

func _on_a_input_3_item_selected(index):
	var texto = nMano2.get_item_text(index)
	itemDosManos(texto,index)

var dosManos = false

func itemDosManos(nombre,index):
	var manos
	recursoArmas.obtenerArma(nombre)
	manos = recursoArmas.manos
	if manos == 2:
		nMano1.select(index)
		nMano2.select(index)
		nMano2.disabled = true
		dosManos = true
	else:
		nMano2.disabled = false
		recursoArmas.obtenerArma(nMano1.get_item_text(nMano1.get_selected_id()))
		if dosManos == true:
			nMano2.select(0)
			dosManos = false
	
