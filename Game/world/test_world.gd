extends Node2D

var hand_card_scene = load("res://stuff/hand_card/hand_card.tscn")

var board_card_scene = load("res://stuff/board_card/board_card.tscn")


var create_hand_card_ref = FuncRef.new()

var create_board_card_ref = FuncRef.new()

func _ready():
	
	create_hand_card_ref.set_instance(self)
	create_hand_card_ref.function = "create_hand_card"
	create_board_card_ref.set_instance(self)
	create_board_card_ref.function = "carete_board_card"
	
	$BoardCardHolder.create_hand_card_ref = create_hand_card_ref
	$BoardCardHolder.create_board_card_ref = create_board_card_ref
	
	$Deck.create_hand_card_ref = create_hand_card_ref
	$Deck.create_board_card_ref = create_board_card_ref
	pass
	


func create_hand_card(card_data : HandCardData):
	var new_card = hand_card_scene.instance() as HandCard
	new_card.card_data = card_data

	
	$CardHolder.add_card(new_card)
	pass


func carete_board_card(card_data : BoardCardData):
	var new_card = board_card_scene.instance() as BoardCard
	new_card.card_data = card_data
	#print("Baord Card LUL")
	$BoardCardHolder.add_card(new_card)
	pass
