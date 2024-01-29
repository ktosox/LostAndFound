extends Control

var create_hand_card_ref : FuncRef

var create_board_card_ref : FuncRef

var deck_card_data : DeckCardData

signal story_finished


func load_page_data(page_data : Page):
	visible = true
	enable()
	$TextBox.bbcode_text = "[center]" + page_data.text
	
	for choice in $Choices.get_children():
		choice.visible = false
		
	var choice_count = 0
	#print(page_data.choices)
	for choice in page_data.choices:
		
		var loaded_choice = $Choices.get_child(choice_count)
		loaded_choice.load_choice_data(choice)
		loaded_choice.visible = true
		choice_count += 1
	
	pass


func load_story(story = "test_story"):
	deck_card_data = DeckCardData.new()
	var file = File.new()
	file.open("res://resources/stories/"+story+".csv", File.READ)
	

	file.get_csv_line()
	var raw_data = file.get_csv_line(";")
	while raw_data.size() > 1:
		
		raw_data_to_page(raw_data)

		
		raw_data = file.get_csv_line(";")

	

	file.close()
	load_page_data(deck_card_data.pages[0])



func raw_data_to_page(raw_data : Array):

	var new_page = Page.new()
	new_page.ID = raw_data[0].to_int()
	new_page.text = raw_data[1]
	var choice_data_length = 4
	var choices_done = 0
	var start_offset = 2
	while choices_done < 3:
		choices_done += 1
		

		var raw_choice_data = raw_data.slice(start_offset + choice_data_length * (choices_done-1),start_offset + choice_data_length * choices_done)

		if raw_choice_data[0] != " ":
			
			var new_choice = ChoiceData.new()
			new_choice.name = raw_choice_data[0]
			new_choice.effect = raw_choice_data[3]
			new_choice.ID = raw_choice_data[1].to_int()

				
			
			var card_values = raw_choice_data[2]
			if card_values.is_valid_filename(): # haHAhaahHAHaha
				card_values = card_values.split("-")
				

				
				new_choice.value_A = HandCardData.value_range_A[card_values[0].to_int()] 
				new_choice.value_B = HandCardData.value_range_B[card_values[0].to_int()] 
				
			if new_choice.name.length() != 0:
				new_page.choices.push_back(new_choice)

	deck_card_data.pages[new_page.ID] = new_page


func process_choice(ID,effect):
	
	# effect stuff goes here
	match effect:
		" ":
			return
		"random_hand_card":
			
# test stuff starts here
			var test_card_data = HandCardData.new()
			test_card_data.value_A = test_card_data.value_range_A[randi() % test_card_data.value_range_A.size()]
			test_card_data.value_B = test_card_data.value_range_B[randi() % test_card_data.value_range_B.size()]
			create_hand_card_ref.call_func(test_card_data)
# test stuff ends here

			pass
		"random_board_card":
			pass

	
	
	process_page_change(ID)
	
	pass

func disable():
	# make the card sockets and other stuff diabled
	pass

func enable():
	# make the card sockets and other stuff enabled
	pass

func process_page_change(ID):
	print("processing cahnge to page ",ID)
	
	
	if ID == -1:
		emit_signal("story_finished")
		
		visible = false
		disable()
		return
	load_page_data(deck_card_data.pages[ID])
	
	
	
	pass
