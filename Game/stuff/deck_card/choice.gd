extends ColorRect


func load_choice_data(data : ChoiceData):
	#$Layout.Label.text = data.text
	
	$Layout.Button.text = data.name
	
	
	pass
