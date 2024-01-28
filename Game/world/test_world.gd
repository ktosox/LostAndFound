extends Node2D

var hand_card_scene = load("res://stuff/hand_card/hand_card.tscn")

var board_card_scene = load("res://stuff/board_card/board_card.tscn")


var create_hand_card_ref = FuncRef.new()

var create_board_card_ref = FuncRef.new()

func _ready():
	
	create_hand_card_ref.set_instance(self)
	create_hand_card_ref.function = "create_hand_card"
	create_board_card_ref.set_instance(self)
	create_board_card_ref.function = "create_board_card"
	
	$BoardCardHolder.create_hand_card_ref = create_hand_card_ref
	$BoardCardHolder.create_board_card_ref = create_board_card_ref
	
	$DeckCard.create_hand_card_ref = create_hand_card_ref
	$DeckCard.create_board_card_ref = create_board_card_ref
	pass
	


func create_hand_card(card_data : HandCardData):
	var new_card = hand_card_scene.instance() as HandCard
	new_card.card_data = card_data

	
	$HandCardHolder.add_card(new_card)
	pass


func create_board_card(card_data : BoardCardData):
	var new_card = board_card_scene.instance() as BoardCard
	new_card.card_data = card_data

	$BoardCardHolder.add_card(new_card)
	pass


func process_end_of_turn():
	for stuff in get_tree().get_nodes_in_group("EndOfTurn"):
		stuff.end_of_turn()
	
	pass

func process_start_of_turn():
	# get next story from deck
	
	$DeckCard.load_story()
	
	pass




func _on_EndTurn_pressed():
	$EndTurn.disabled = true
	process_end_of_turn()
	yield(get_tree().create_timer(0.4),"timeout")
	process_start_of_turn()
	pass # Replace with function body.


func _on_DeckCard_story_finished():
	$EndTurn.disabled = false
	pass # Replace with function body.
