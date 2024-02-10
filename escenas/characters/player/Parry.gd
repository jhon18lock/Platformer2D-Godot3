extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("parry")
	_s = anim_character.connect("animation_finished", self, "parry")
	
func parry(anim_name:String):
	if anim_name == "parry":
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "parry")

	
