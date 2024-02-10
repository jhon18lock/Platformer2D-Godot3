extends State

var _s

func enter():
	character.velocity = Vector2.ZERO
	anim_character.play("attack")
	_s = anim_character.connect("animation_finished", self, "attacked")
	
	var dir = move_toward(character.global_position.x, character.player_pos_attack.x, 1)
	character.velocity.x = dir * character.direction.x
	
func attacked(anim_name:String):
	if anim_name == "attack":
		state_machine.change_state("Idle")
		
func physics(_delta):
	.get_direction()

func exit():
	anim_character.disconnect("animation_finished", self, "attacked")
