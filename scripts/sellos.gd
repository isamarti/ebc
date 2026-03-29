extends Control



func _ready() -> void:
	$SolidaridadBW.visible=true
	$TransparenciaBw.visible=true
	$DignidadBw.visible=true
	$JusticiaBw.visible=true
	open_sellos()
	
	
func open_sellos():
	if Globals.justicia:
		$JusticiaBw.visible=false
	if Globals.solidaridad:
		$SolidaridadBW.visible=false
	if Globals.dignidad:
		$DignidadBw.visible=false
	if Globals.transparencia:
		$TransparenciaBw.visible=false
