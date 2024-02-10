extends State

var original_gravity:float = 0

func enter():
	character.velocity.y = 0
	original_gravity = character.gravity
	character.gravity = character.gravity * 0.1
	anim_character.play("wall")
	
func handle_input(_event):
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("Jump")

	
func physics(_delta):
	if character.is_on_floor():
		state_machine.change_state("Idle")
		
	if not character.raycast.is_colliding():
		state_machine.change_state("Idle")
		character.gravity = original_gravity
		
		
func exit():
	character.gravity = original_gravity
