extends State

func enter():
	anim_character.play("Dead")
	
func physics(_delta):
	if character.is_on_floor():
		#desactivar la mascara de colision (player)
		character.set_collision_mask_bit(0, false)
		state_machine.active = false
		character.set_physics_process(false)
