extends Node2D

var value_A
var value_B


# Called when the node enters the scene tree for the first time.
func _ready():
	test_set_values()
	load_card_data()
	pass # Replace with function body.

# once card is hovered over recepticle
# check if card is valid
# if card is valid -> connect it's "dropped" signal to a function that consumes it
# once dropped -> consume
# if card leaves recepticle -> detach signal from fucntion


func load_card_data():
	if value_B != null:
		$RichTextLabel.text = value_B
	else:
		$RichTextLabel.visible = false
	if value_A != null:
		$TestHandCardEater/Polygon2D.color = ColorN(value_A)
	pass


func test_set_values():
	match randi() % 3:
		0:
			value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
		1:
			value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]
		2:
			value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
			value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]



func _on_TestHandCardEater_body_entered(body):
	var data_to_check = body.get_card_data()
	# data check goes here
	if value_A != null:
		if value_A != data_to_check.value_A:
			return
	if value_B != null:
		if value_B != data_to_check.value_B:
			return
	if true:
		modulate = ColorN("yellow")
		body.connect("dropped",self,"consume_card")
	
	pass # Replace with function body.


func _on_TestHandCardEater_body_exited(body):
	modulate = ColorN("white")
	body.disconnect("dropped",self,"consume_card")
	pass # Replace with function body.
