extends State

var _s

func enter():
	anim_character.play("Attack")
	_s = anim_character.connect("animation_finished", self, "attacked")
	attack()
	
func attacked(anim_name:String):
	if anim_name == "Attack":
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")

func attack():
	if character.enemies.size() > 0:
		for enemy in character.enemies:
			if not enemy.state_machine.current_state.name in ["Dead", "Hit"]:
				enemy.state_machine.change_state("Hit")
	pass
	
"""
para que se pueda mover en un ataque se debe llamar la funcion physics

func physics(delta):
	.get_direction()
	.move()
"""
