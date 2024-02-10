extends State

var _s

func enter():
	anim_character.play("Hit")
	_s = anim_character.connect("animation_finished", self, "hitted")
	jump()
	
func hitted(anim_name:String):
	if anim_name == "Hit":
		character.lifes -= 1
		if character.lifes <= 0:
			state_machine.change_state("Dead")
			return
		state_machine.change_state("Idle")
		
func jump():
	character.velocity.y = -100
	character.velocity.x = speed * -character.direction.x
	
func exit():
	anim_character.disconnect("animation_finished", self, "hitted")
