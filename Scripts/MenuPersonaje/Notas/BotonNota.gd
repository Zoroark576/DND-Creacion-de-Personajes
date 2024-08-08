extends Button
class_name botonNota
var titulo

signal cargarNota

func crearBoton(tituloSet):
	titulo = tituloSet
	text = titulo

func _on_pressed():
	cargarNota.emit(titulo)
