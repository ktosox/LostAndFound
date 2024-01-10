extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# once card is hovered over recepticle
# check if card is valid
# if card is valid -> connect it's "dropped" signal to a function that consumes it
# once dropped -> consume
# if card leaves recepticle -> detach signal from fucntion
func consume_card(card : HandCard):
	card.queue_free()
	pass


func _on_TestHandCardEater_body_entered(body):
	var data_to_check = body.get_card_data()
	# data check goes here
	if true:
		modulate = ColorN("yellow")
		body.connect("dropped",self,"consume_card")
	
	pass # Replace with function body.


func _on_TestHandCardEater_body_exited(body):
	modulate = ColorN("white")
	body.disconnect("dropped",self,"consume_card")
	pass # Replace with function body.
