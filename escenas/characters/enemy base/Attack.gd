extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("attack")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
	"""
	var dir = move_toward(character.global_position.x, character.player_pos_attack.x, 1)
	character.velocity.x = dir * character.direction.x
	print("enemy dir X en ataque enter: ", dir)
	print("enemy velocity X en ataque enter: ", character.velocity.x)
	"""
	
	
	
func attacked(anim_name:String):
	if anim_name == "attack":
		state_machine.change_state("Idle")
		
func physics(_delta):
	.get_direction()
	
	#character.global_position = character.global_position.move_toward(character.player_pos_attack, character.speed * _delta)
	#character.global_position = character.global_position.move_toward(character.player_pos_attack, 250 * _delta)
	var dir = character.global_position.move_toward(character.player_pos_attack, 250 * _delta)
	character.global_position.x = dir.x

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")
