extends Button

signal end_turn

# keeps track od deck data

# triggers end of turn

# draws next card from deck

# loads card on to deck card screen



func _ready():
	$DeckCardScreen.visible = false


func _on_Deck_pressed():
	
	emit_signal("end_turn")
	
	# get next card data
	
	
	
	pass # Replace with function body.
