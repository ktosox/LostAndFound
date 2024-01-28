extends Button

signal end_turn

# keeps track od deck data

# triggers end of turn

# draws next card from deck

# loads card on to deck card screen

var create_hand_card_ref : FuncRef

var create_board_card_ref : FuncRef

var deck_card_data : DeckCardData

func _ready():
	test_load_deck_card_data()
	
	var change_page = FuncRef.new()
	change_page.function = "process_page_change"
	change_page.set_instance(self)
	$EventCard.change_page = change_page

func test_load_deck_card_data():
	deck_card_data = DeckCardData.new()
	var file = File.new()
	file.open("res://resources/stories/test_story.csv", File.READ)
	

	file.get_csv_line()
	var raw_data = file.get_csv_line(";")
	while raw_data.size() > 1:
		
		load_page(raw_data)

		
		raw_data = file.get_csv_line(";")

	

	file.close()
	pass

func load_page(page_data : Array):
	var new_page = Page.new()
	new_page.ID = page_data.pop_front().to_int()
	new_page.text = page_data.pop_front()
	
	while page_data.size() > 0:
		if page_data[0] != " ":
			
			var new_choice = ChoiceData.new()
			new_choice.name = page_data.pop_front()
			new_choice.ID = page_data.pop_front().to_int()
			var card_values = page_data.pop_front()
			if card_values.is_valid_filename(): # haHAhaahHAHaha
				card_values = card_values.split("-")
				
				#print(HandCardData.value_range_A[card_values[0].to_int()] ,HandCardData.value_range_B[card_values[1].to_int()] )
				
				new_choice.value_A = HandCardData.value_range_A[card_values[0].to_int()] 
				new_choice.value_B = HandCardData.value_range_B[card_values[0].to_int()] 
				
			if new_choice.name.length() != 0:
				new_page.choices.push_back(new_choice)

	deck_card_data.pages[new_page.ID] = new_page



func process_page_change(ID):
	print("processing cahnge to page ",ID)
	if ID == -1:
		print(" ze End")
		# card creation stuff should go here
		$EventCard.visible = false
		return
	$EventCard.load_page_data(deck_card_data.pages[ID])
	
		# test stuff starts here
	var test_card_data = HandCardData.new()
	test_card_data.value_A = test_card_data.value_range_A[randi() % test_card_data.value_range_A.size()]
	test_card_data.value_B = test_card_data.value_range_B[randi() % test_card_data.value_range_B.size()]
	create_hand_card_ref.call_func(test_card_data)
	
	# test stuff ends here
	
	
	pass

func _on_Deck_pressed():
	
	emit_signal("end_turn")
	$EventCard.visible = true
	$EventCard.load_page_data(deck_card_data.pages[0])
	# get next card data
	
	
	
	pass # Replace with function body.
