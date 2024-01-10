class_name HandCard

extends RigidBody2D

var card_data : HandCardData

signal dropped(card)

# needs to swap between Kinewmatic Mode for dragging and Charcter for being held in hand

# needs to call load_card_data on CardDisplayer on creation with all of the relvant data


func _ready():
	modulate = ColorN("gray")
	$DisplayHolder/HandCardDisplayer.load_card_data(card_data)

func _on_Draggy_dragging(state):
	# "state" is wether dragging just started or stopped
	#print("drag state changed: ", state)
	if state:
		mode = RigidBody2D.MODE_CHARACTER
	if !state:
		emit_signal("dropped",self)
		_reset_pos_and_mode()


	pass # Replace with function body.

func _reset_pos_and_mode():
	position = Vector2(0,0)

	#yield(get_tree().create_timer(0.05), "timeout")
	mode = RigidBody2D.MODE_KINEMATIC
	pass


func get_selected():
	z_index = 2
	$DisplayHolder.scale = Vector2(1,1)
	modulate = ColorN("white")
	
	pass

func get_deselected():
	z_index = 0
	$DisplayHolder.scale = Vector2(0.5,0.5)
	modulate = ColorN("gray")
	_reset_pos_and_mode()
	
	pass

func get_card_data():
	return card_data
	pass


func _on_Draggy_selected(state):
	if state:
		get_selected()
	else:
		get_deselected()
