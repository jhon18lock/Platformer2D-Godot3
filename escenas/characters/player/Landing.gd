extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("landing")
	_s = anim_character.connect("animation_finished", self, "landing")
	
func landing(anim_name:String):
	if anim_name == "landing":
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "landing")

	
"""
para que se pueda mover en un ataque se debe llamar la funcion physics

func physics(delta):
	.get_direction()
	.move()
"""
