extends State

var _s

func enter():
	anim_character.play("attack_1_b")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
func attacked(anim_name:String):
	if anim_name == "attack_1_b":
		state_machine.change_state("Idle")
		
func handle_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("Attack_2")

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")

	
