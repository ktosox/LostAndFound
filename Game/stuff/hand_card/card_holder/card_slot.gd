extends Node2D




var assigned_card 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func assign_card(card:HandCard):

	assigned_card = card
	card.connect("tree_exited",self,"queue_free")
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

