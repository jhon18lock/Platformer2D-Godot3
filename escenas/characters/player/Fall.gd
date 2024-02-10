extends State

#onready var raycast:RayCast2D = character.raycast

func enter():
	anim_character.play("fall")

	
func handle_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("Attack")
		
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("Jump")
	
func physics(_delta):
	#al colocar punto, estamos utilizando las funciones heredadas
	.get_direction()
	.move()
	
	if character.is_on_floor():
		state_machine.change_state("Landing")

	
	if character.raycast.is_colliding():
		state_machine.change_state("Wall")	
