class_name HandCard

extends RigidBody2D

var card_data : HandCardData

# needs to swap between Kinewmatic Mode for dragging and Charcter for being held in hand

# needs to call load_card_data on CardDisplayer on creation with all of the relvant data
func _ready():
	var card_disply = load("res://stuff/hand_card/hand_card_displayer.tscn").instance()
	add_child(card_disply)
	


func _on_Draggy_dragging(state):
	# "state" is wether dragging just started or stopped
	print("drag state changed: ", state)
	if !state:
		mode = RigidBody2D.MODE_KINEMATIC
		position = Vector2(0,0)
		yield(get_tree().create_timer(0.2), "timeout")
		mode = RigidBody2D.MODE_CHARACTER


	pass # Replace with function body.
