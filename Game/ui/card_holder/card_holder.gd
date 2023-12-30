extends HBoxContainer

var card_slot_scene = preload("res://ui/card_holder/card_slot.tscn") # the scene to which each card is attached


func add_card(new_card : Card):
	
	# make a card slot
	# add it to the holder
	# attach the card to it
	pass


# expected behaviour

# allows dynamicly adding and removing cards

# allows card zoom on selection - I do this by messing with Node2D Zindex
