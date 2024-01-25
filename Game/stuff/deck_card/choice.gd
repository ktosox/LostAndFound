extends VBoxContainer


func load_choice_data(data : ChoiceData):
	$Label.text = data.text
	
	$Button.text = data.name
	
	
	pass
