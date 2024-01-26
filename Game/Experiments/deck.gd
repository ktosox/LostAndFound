extends Button

signal end_turn

# keeps track od deck data

# triggers end of turn

# draws next card from deck

# loads card on to deck card screen

var deck_card_data : DeckCardData

func _ready():
	test_load_deck_card_data()
	$EventCard.load_page_data(deck_card_data.pages[0])
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
		
		deck_card_data.load_page(raw_data)

		
		raw_data = file.get_csv_line(";")

	

	file.close()
	pass

func process_page_change(ID):
	print("processing cahnge to page ",ID)
	if ID == -1:
		print(" ze End")
		$EventCard.queue_free()
		return
	$EventCard.load_page_data(deck_card_data.pages[ID])
	
	pass

func _on_Deck_pressed():
	
	emit_signal("end_turn")
	
	# get next card data
	
	
	
	pass # Replace with function body.
