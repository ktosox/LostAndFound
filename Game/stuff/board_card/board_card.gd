class_name BoardCard

extends RigidBody2D

var card_data : BoardCardData

var process_choice_ref : FuncRef

var life_time : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#test_set_values()
	#load_card_data(card_data)
	load_card_data(card_data)
	update_remaining_time(life_time)
	pass # Replace with function body.


func choice_processing(ID):
	process_choice_ref.call_func(ID)
	pass

func load_card_data(card_data : BoardCardData):
	$TextBox.text = card_data.text
	
	for choice in $Choices.get_children():
		choice.visible = false
		
	var choice_count = 0
	#print(page_data.choices)
	for choice in card_data.choices:
		
		var loaded_choice = $Choices.get_child(choice_count)
		loaded_choice.load_choice_data(choice)
		loaded_choice.visible = true
		choice_count += 1

func update_remaining_time(time : int):
	$RemainingTime.text = "Time left: " + String(time)
	pass

func end_of_turn():
	if life_time < 0 :
		return
	if life_time == 0 :
		print("resolve board card")
	life_time = life_time - 1
	update_remaining_time(life_time)
	
	pass

func test_set_values():
	card_data = BoardCardData.new()
	card_data.text = "TEST TEXT 123"
	var choice1 = ChoiceData.new()
	choice1.name = "An option"
#	match randi() % 3:
#		0:
#			choice1.value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
#		1:
#			choice1.value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]
#		2:
#			choice1.value_A = HandCardData.value_range_A[randi() % HandCardData.value_range_A.size()]
#			choice1.value_B = HandCardData.value_range_B[randi() % HandCardData.value_range_B.size()]
	card_data.choices.push_back(choice1)
