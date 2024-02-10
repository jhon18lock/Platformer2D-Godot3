extends State

var _s

func enter():
	anim_character.play("attack_2")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
func attacked(anim_name:String):
	if anim_name == "attack_2":
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")

	
