extends ColorRect

var ID

var effect 

signal choice_selected(ID,effect)

func load_choice_data(data : ChoiceData):
	#$Layout.Label.text = data.text
	ID = data.ID
	effect = data.effect
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
	emit_signal("choice_selected",ID,effect)
	
	pass # Replace with function body.


func _on_CardSocket_unlock():
	emit_signal("choice_selected",ID,effect)
	pass # Replace with function body.
