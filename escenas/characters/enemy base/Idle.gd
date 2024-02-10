extends State


func enter():
	anim_character.play("idle")


func physics(_delta):
	#al colocar punto, estamos utilizando las funciones heredadas
	.get_direction()
	.move()
	
	#se pone punto para acceder funciones del script heredado
	
	if direction.x != 0:
		state_machine.change_state("Run")
