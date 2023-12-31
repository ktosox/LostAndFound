class_name Card

extends RigidBody2D

var card_data : CardData

# needs to swap between Kinewmatic Mode for dragging and Charcter for being held in hand

# needs to call load_card_data on CardDisplayer on creation with all of the relvant data


func _on_Draggy_dragging(state):
	# "state" is wether dragging just started or stopped
	print("drag state changed: ", state)
	
	pass # Replace with function body.
