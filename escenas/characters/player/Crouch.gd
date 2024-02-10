extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("crouch")
	_s = anim_character.connect("animation_finished", self, "crouch")
	
func crouch(anim_name:String):
	
	"""
	if anim_name == "crouch":
		state_machine.change_state("Idle")
	"""
	pass
	
func handle_input(_event):
	if Input.is_action_just_released("ui_down"):
		state_machine.change_state("Idle")

func exit():
	anim_character.disconnect("animation_finished", self, "crouch")

	
