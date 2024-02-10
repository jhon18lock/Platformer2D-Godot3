extends State

var _ch_s

func enter():
	anim_character.play("dead")
	
func physics(_delta):
	if character.is_on_floor():
		state_machine.active = false
		character.set_physics_process(false)
		
		yield(get_tree().create_timer(2), "timeout")
		_ch_s = get_tree().reload_current_scene()
