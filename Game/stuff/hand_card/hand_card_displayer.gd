extends ViewportContainer


onready var last_location = rect_global_position

func load_card_data(data : HandCardData):
	
	# use "data" to load visual card stuff
	
	pass
func _ready():
	$Viewport.own_world = true # this has to be here since world can't be own in editor

func card_movement_to_tilt(delta:float):
	var max_tilt = 0.27
	var tilt_speed = 2
	var card_body = $Viewport/CardWorld/Body as Spatial
	var tilt_vector = last_location - rect_global_position
	card_body.rotation.x = move_toward(card_body.rotation.x, -tilt_vector.y,delta * tilt_speed)
	card_body.rotation.z = move_toward(card_body.rotation.z, tilt_vector.x,delta * tilt_speed)

	card_body.rotation.x = clamp(card_body.rotation.x,-max_tilt,max_tilt)
	card_body.rotation.z = clamp(card_body.rotation.z,-max_tilt,max_tilt)
	
	last_location = rect_global_position
	pass


func _process(delta):
	card_movement_to_tilt(delta)
	pass
