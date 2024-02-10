extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("attack_1")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
func attacked(anim_name:String):
	if anim_name == "attack_1":
		state_machine.change_state("Attack_1_B")

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")

	
"""
para que se pueda mover en un ataque se debe llamar la funcion physics

func physics(delta):
	.get_direction()
	.move()
"""
