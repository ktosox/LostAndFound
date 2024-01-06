extends Control

var options_menu_scene = preload("res://ui/options_menu.tscn")

# what do I need in here?

# audio sliders -> but only after I add some god damn audio

# text printing


func _on_Options_pressed():
	var new_options_menu = options_menu_scene.instance()
	add_child(new_options_menu)
	pass # Replace with function body.
