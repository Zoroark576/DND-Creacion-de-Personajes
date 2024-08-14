extends Button
@export var nCajaDeTexto : TextEdit

func _on_pressed():
	nCajaDeTexto.text += DisplayServer.clipboard_get()
