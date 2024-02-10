extends State

func enter():
	anim_character.play("Run")


func physics(_delta):
	.get_direction()
	.move()
	
	#se pone punto para acceder funciones del script heredado
	
	if direction.x == 0:
		state_machine.change_state("Idle")
