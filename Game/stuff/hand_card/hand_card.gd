class_name HandCard

extends RigidBody2D

var card_data : HandCardData

# needs to swap between Kinewmatic Mode for dragging and Charcter for being held in hand

# needs to call load_card_data on CardDisplayer on creation with all of the relvant data




func _on_Draggy_dragging(state):
	# "state" is wether dragging just started or stopped
	#print("drag state changed: ", state)
	if !state:
		mode = RigidBody2D.MODE_KINEMATIC
		_reset_pos_and_mode()


	pass # Replace with function body.

func _reset_pos_and_mode():
	position = Vector2(0,0)

	yield(get_tree().create_timer(0.1), "timeout")
	mode = RigidBody2D.MODE_KINEMATIC
	pass


func get_selected():
	z_index = 2
	mode = RigidBody2D.MODE_CHARACTER
	modulate = ColorN("yellow")
	pass

func get_deselected():
	z_index = 0
	modulate = ColorN("white")
	mode = RigidBody2D.MODE_KINEMATIC
	_reset_pos_and_mode()
	
	pass




func _on_Draggy_selected(state):
	if state:
		get_selected()
	else:
		get_deselected()
