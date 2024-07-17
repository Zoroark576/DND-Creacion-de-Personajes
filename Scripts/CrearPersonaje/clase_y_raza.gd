extends GridContainer
@export var clase : LineEdit
@export var raza : LineEdit

func _ready():
	clase.text = Personaje.nombreClase
	raza.text = Personaje.nombreRaza



