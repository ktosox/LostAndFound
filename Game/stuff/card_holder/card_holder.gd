extends Node2D

var card_slot_scene = preload("./card_slot.tscn") # the scene to which each card is attached

var cards_and_slots = {}


func add_card(new_card ):
	
	var new_slot = card_slot_scene.instance()
	new_slot.add_child(new_card)
	cards_and_slots[new_card] = new_slot
	new_slot.assign_card(new_card)
	new_slot.global_position = Vector2(global_position.x + cards_and_slots.size() * 90, global_position.y)
	
	$CardArrenger.add_child(new_slot)
	
	#$CardArrenger.update_order()
	

	pass



# expected behaviour

# allows dynamicly adding and removing cards

# allows card zoom on selection - I do this by messing with Node2D Zindex


func _on_TestAddCard_pressed():
	var test_card = load("res://stuff/hand_card/hand_card.tscn").instance() as HandCard
	var test_card_data = HandCardData.new()
	test_card_data.value_A = randi() % test_card_data.value_range_A.size()
	test_card_data.value_B = randi() % test_card_data.value_range_B.size()

	test_card.card_data = test_card_data
	add_card(test_card)
	pass # Replace with function body.
