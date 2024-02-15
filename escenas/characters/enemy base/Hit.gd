extends State


var _s

func enter():
	anim_character.play("hit")
	_s = anim_character.connect("animation_finished", self, "hitted")
	#jump()
	character.velocity.x = -character.knockback_dir.x
	
func hitted(anim_name:String):
	if anim_name == "hit":
		state_machine.change_state("Idle")
	"""
	if anim_name == "hit":
		character.lifes -= 1
		if character.lifes <= 0:
			state_machine.change_state("Dead")
			return
		state_machine.change_state("Idle")
	"""
		
func jump():
	character.velocity.y = -50
	character.velocity.x = speed * -character.direction.x
	
func exit():
	anim_character.disconnect("animation_finished", self, "hitted")
