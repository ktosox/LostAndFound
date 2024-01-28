extends Node2D


# consumes the card OR keeps it in place

# emits signal when card is taken

signal unlock

var value_A # value_range_A = ["YELLOW","LIGHTBLUE","PEACHPUFF"]

var value_B # value_range_B  = ["A","B","C","D"]

var card_drop_ref : FuncRef

var disabled = false

func _ready():
	card_drop_ref = FuncRef.new()
	card_drop_ref.function = "consume_card"
	card_drop_ref.set_instance(self)
	randomize()
	#test_set_values()
	#update_shown_values()

func update_shown_values():
	if value_B != null:
		$RichTextLabel.visible = true
		$RichTextLabel.text = value_B
	else:
		$RichTextLabel.visible = false
	if value_A != null:
		$Polygon2D.color = ColorN(value_A)
	else:
		$Polygon2D.color = ColorN("White")
	pass



	
	
	pass # Replace with function body.

func consume_card(card : HandCard):
	card.queue_free()
	emit_signal("unlock")
	pass

func _on_TestHandCardEater_body_exited(body):
	modulate = ColorN("white")
	body.disconnect("dropped",self,"consume_card")


func is_card_valid(card_data : HandCardData):
	var result = !disabled
	if value_B != null:
		if card_data.value_B != value_B:
			result = false
	if value_A != null:
		if card_data.value_A != value_A:
			result = false
	return result
	pass

func _on_CardSocket_body_entered(card: HandCard):
	if is_card_valid(card.card_data):
		$Glow.visible = true
		card.drop_override = card_drop_ref

	pass # Replace with function body.


func _on_CardSocket_body_exited(card : HandCard):
	$Glow.visible = false
	if card.drop_override == card_drop_ref:
		card.drop_override = null
	pass # Replace with function body.
