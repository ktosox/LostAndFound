extends DampedSpringJoint2D

signal dragging(state)

signal selected(state)

var drag = false


func _ready():
	$MouseDetector.color = Color(randf(),randf(),randf(),0.4)
	
func _physics_process(delta):
	
	if drag:
		$GrabbyPart.global_position = get_global_mouse_position()

		

func _input(event):
	if event.is_class("InputEventMouseButton") and drag:
		if event.button_index == 1 and !event.is_pressed():
			emit_signal("dragging",false)
			drag = false
			$GrabbyPart.global_position = global_position
			




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
