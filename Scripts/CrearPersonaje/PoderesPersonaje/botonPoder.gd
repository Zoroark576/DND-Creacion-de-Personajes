extends HBoxContainer
class_name botonPoderRasgo
@export var botonPoder : Button
@export var usado : CheckBox
var nombre : String
var categoria : String

var verPoder = preload("res://Escenas/VerPersonaje/VerPoder.tscn")

func crearBoton(nombreBoton : String,unSoloUso : bool):
	nombre = nombreBoton
	usado.visible = unSoloUso
	botonPoder.text = nombre

func _ready():
	categoria = get_parent().name

func _on_poder_pressed():
	var nuevaEscena = verPoder.instantiate()
	nuevaEscena.mirarPoder(nombre,obtenerCategoria().get(nombre))
	get_tree().root.add_child(nuevaEscena)
	get_tree().root.remove_child(self)

func obtenerCategoria():
	if categoria == "Voluntad" or categoria == "Diarios" or categoria == "Encuentro" or categoria == "Utilidad":
		return Personaje.poderes
	elif categoria == "Dotes":
		return Personaje.dotes
	elif categoria == "Rasgos":
		return Personaje.rasgosDeClase

