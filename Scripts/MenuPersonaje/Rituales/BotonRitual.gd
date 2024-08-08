extends Button
class_name botonRitual
var titulo

signal cargarRitual

func crearBoton(tituloSet):
	titulo = tituloSet
	text = titulo

func _on_pressed():
	cargarRitual.emit(titulo)
