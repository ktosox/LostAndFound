extends ColorRect

var ID

signal choice_selected(ID)

func load_choice_data(data : ChoiceData):
	#$Layout.Label.text = data.text
	ID = data.ID
	$Button.text = data.name
	$Button.disabled = false
	$CardSocket.visible = false
	$CardSocket.disabled = true
	if data.value_A.length() != 0 or data.value_B.length() != 0:
		$CardSocket.value_A = data.value_A
		$CardSocket.value_B = data.value_B
		$CardSocket.update_shown_values()
		$CardSocket.visible = true
		$Button.disabled = true
		$CardSocket.disabled = false
	pass


func _on_Button_pressed():
	print("unlock 1")
	emit_signal("choice_selected",ID)
	
	pass # Replace with function body.


func _on_CardSocket_unlock():
	print("unlock 2")
	emit_signal("choice_selected",ID)
	pass # Replace with function body.
