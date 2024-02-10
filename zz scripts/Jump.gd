extends State

func enter():
	anim_character.play("Jump")
	jump()

func jump():
	character.velocity.y = -250
	
func physics(_delta):
	#al colocar punto, estamos utilizando las funciones heredadas
	.get_direction()
	.move()
	
	if character.is_on_floor():
		state_machine.change_state("Idle")
