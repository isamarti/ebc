extends Node

var dignidad=false
var justicia=false
var solidaridad=false
var transparencia=false
var sellos=0
var entrada=true

var bg_music: AudioStreamPlayer

func _ready():
	bg_music = AudioStreamPlayer.new()
	bg_music.finished.connect(_on_bg_music_finished)
	var stream = preload("res://assets/music/Glass_Petals_Falling.mp3")
	bg_music.stream = stream
	# Set process_mode to always so it plays even if game is paused
	bg_music.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(bg_music)
	bg_music.volume_db = -15.0
	bg_music.play()

func update_sellos():
	sellos+=1

func _on_bg_music_finished():
	bg_music.play()
