extends Node2D

export var card_spread_distance = 90



func update_order():
	var amount_of_cards_held = get_child_count()
	var location_array = []
	var offest = (-(amount_of_cards_held-1)/2.0) * card_spread_distance
#	print("card_amount: ",card_amount,"offest: ", offest)
	while amount_of_cards_held > 0:
		location_array.push_back(offest)
		offest = offest + card_spread_distance
		amount_of_cards_held-=1

		pass

	for C in get_children():
		C.position.x = location_array.pop_front()
		#print(C,C.position.x)	
	pass


func _on_CardArrenger_child_entered_tree(node):
	update_order()
	pass # Replace with function body.


func _on_CardArrenger_child_exiting_tree(node):
	yield(get_tree().create_timer(0.1), "timeout")
	update_order()
	pass # Replace with function body.
