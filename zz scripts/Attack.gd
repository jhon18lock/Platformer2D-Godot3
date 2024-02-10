extends State

var _s

func enter():
	anim_character.play("Attack")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
func attacked(anim_name:String):
	if anim_name == "Attack":
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")
