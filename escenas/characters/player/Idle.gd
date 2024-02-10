extends State

func enter():
	anim_character.play("idle")
	
func handle_input(_event):
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("Jump")
		
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("Attack_1")
		
	if Input.is_action_just_pressed("ui_select"):
		state_machine.change_state("Parry")
		
	if Input.is_action_just_pressed("ui_down"):
		state_machine.change_state("Crouch")
	
func physics(_delta):
	#al colocar punto, estamos utilizando las funciones heredadas
	.get_direction()
	.move()
	
	#se pone punto para acceder funciones del script heredado
	
	if direction.x != 0:
		state_machine.change_state("Run")
		
	if not character.is_on_floor():
		state_machine.change_state("Fall")
