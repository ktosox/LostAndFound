class_name DeckCardData

extends Resource

export var pages : Dictionary # key - page ID / value - Page


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

	pages[new_page.ID] = new_page
	
	
	pass
	

