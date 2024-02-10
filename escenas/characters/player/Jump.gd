extends State

#onready var raycast:RayCast2D = character.raycast

func enter():
	anim_character.play("jump")
	jump()

func jump():
	character.velocity.y = character.jump_velocity
	
func handle_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("Attack")
	
func physics(_delta):
	#al colocar punto, estamos utilizando las funciones heredadas
	.get_direction()
	.move()
	
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
	
	if character.is_on_floor():
		state_machine.change_state("Idle")
		
	"""
	solamente en fall, para que pueda saltar en pared
	
	if character.raycast.is_colliding():
		state_machine.change_state("Wall")
	"""
