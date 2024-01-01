extends HBoxContainer

var card_slot_scene = preload("./card_slot.tscn") # the scene to which each card is attached


func add_card(new_card ):
	var new_slot = card_slot_scene.instance()
	new_slot.add_child(new_card)
	add_child(new_slot)
	# add it to the holder
	# attach the card to it
	pass


# expected behaviour

# allows dynamicly adding and removing cards

# allows card zoom on selection - I do this by messing with Node2D Zindex


func _on_TestAddCard_pressed():
	var test_card = load("res://stuff/hand_card/hand_card.tscn").instance() as HandCard
	

	add_card(test_card)
	pass # Replace with function body.
