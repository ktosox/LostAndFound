extends Control

var change_page: FuncRef

func load_page_data(page_data : Page):
	
	$TextBox.text = page_data.text
	
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

func choice_processing(ID):
	change_page.call_func(ID)
	pass
