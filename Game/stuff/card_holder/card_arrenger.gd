extends Node2D

export var space_between = 150


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func update_order():
	var card_amount = get_child_count()
	var location_array = []
	var offest = (-(card_amount-1)/2.0) * space_between
	print("card_amount: ",card_amount,"offest: ", offest)
	while card_amount > 0:
		location_array.push_back(offest)
		offest = offest + space_between
		card_amount-=1
			
		pass

	for C in get_children():
		C.position.x = location_array.pop_front()
		print(C,C.position.x)
	
	pass
