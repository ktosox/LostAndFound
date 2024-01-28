extends Node2D



var create_hand_card_ref : FuncRef

var create_board_card_ref : FuncRef



func add_card(new_card : BoardCard):
	new_card.global_position = $SpawnPoint.global_position
	add_child(new_card)
	
	
	$SpawnPoint.global_position = Vector2(rand_range(200,1250),rand_range(50,650)) 
	pass




func _on_Button_pressed():
	
	# test stuff starts
	var card_data = BoardCardData.new()
	card_data.text = "TEST TEXT 123"
	var choice1 = ChoiceData.new()
	choice1.name = "An option"
#	match randi() % 3:
#		0:
#			choice1.value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
#		1:
#			choice1.value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]
#		2:
#			choice1.value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
#			choice1.value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]
	card_data.choices.push_back(choice1)
	
	# test stuff ends
	
	
	create_board_card_ref.call_func(card_data)
	pass # Replace with function body.
