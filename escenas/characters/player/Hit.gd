extends State

var _s

func enter():
	anim_character.play("hit")
	update_lifes()
	#character.invulnerable()
	jump()
	_s = anim_character.connect("animation_finished", self, "hitted")
	
func hitted(_anim_name:String):
	#if anim_name == "Hit":
		
	if character.lifes <= 0:
		state_machine.change_state("Dead")
		return
	state_machine.change_state("Idle")
		
func update_lifes():
	#if not character.is_invulnerable:
		#character.lifes -= 1
			
		#GLOBAL.lifes = character.lifes
		
	pass
		
func jump():
	#character.velocity.y = character.jump_velocity / 2
	#character.velocity.x = speed * character.direction.x
	character.velocity.x = -character.knockback_dir.x #* speed

	
func exit():
	anim_character.disconnect("animation_finished", self, "hitted")
