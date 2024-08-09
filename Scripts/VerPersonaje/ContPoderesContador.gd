extends ScrollContainer

@export var lVoluntad : Label
@export var lDiarios : Label
@export var lEncuentro : Label
@export var lUtilidad : Label
@export var lDotes : Label
@export var lRasgos : Label
@export var cVoluntad : VBoxContainer
@export var cDiarios : VBoxContainer
@export var cEncuentro : VBoxContainer
@export var cUtilidad : VBoxContainer
@export var cDotes : VBoxContainer
@export var cRasgos : VBoxContainer


func numeroDePoderes():
	lEncuentro.text +=": " + str(cEncuentro.get_child_count())
	lUtilidad.text +=": " + str(cUtilidad.get_child_count())
	lDotes.text +=": " + str(cDotes.get_child_count())
	lRasgos.text +=": " + str(cRasgos.get_child_count())
	lVoluntad.text +=": " + str(cVoluntad.get_child_count())
	lDiarios.text +=": " + str(cDiarios.get_child_count())
	lEncuentro.text +=": " + str(cEncuentro.get_child_count())
	lUtilidad.text +=": " + str(cUtilidad.get_child_count())
	lDotes.text +=": " + str(cDotes.get_child_count())
	lRasgos.text +=": " + str(cRasgos.get_child_count())
