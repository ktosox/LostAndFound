extends DampedSpringJoint2D

signal dragging(state)

signal selected(state)

var drag = false


	
func _physics_process(delta):
	
	if drag:
		$GrabbyPart.global_position = get_global_mouse_position()

		

func _input(event):
	if event.is_class("InputEventMouseButton") and drag:
		if event.button_index == 1 and !event.is_pressed():
			emit_signal("dragging",false)
			drag = false
			$GrabbyPart.global_position = global_position
			if($MouseDetector.get_rect().has_point(get_local_mouse_position())):
				yield(get_tree().create_timer(0.05), "timeout")
				_on_MouseDetector_mouse_entered()




func _on_MouseDetector_gui_input(event):
	if event.is_class("InputEventMouseButton") and !drag :
		if event.button_index == 1 and event.is_pressed():
			drag = true

			emit_signal("dragging",true)

	pass # Replace with function body.


func _on_MouseDetector_mouse_entered():
	emit_signal("selected",true)
	pass # Replace with function body.


func _on_MouseDetector_mouse_exited():
	emit_signal("selected",false)
	pass # Replace with function body.
