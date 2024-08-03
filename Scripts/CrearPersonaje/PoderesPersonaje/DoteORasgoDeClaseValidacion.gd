extends GridContainer
@export var nOpciones1 : OptionButton
@export var nOpciones2 : OptionButton




func _on_option_button_item_selected(index):
	if nOpciones1.get_item_text(index) == nOpciones2.get_item_text(nOpciones2.get_selected_id()):
		nOpciones1.select(0) 


func _on_option_button_item_selected2(index):
	if nOpciones2.get_item_text(index) == nOpciones1.get_item_text(nOpciones1.get_selected_id()):
		nOpciones2.select(0) 
