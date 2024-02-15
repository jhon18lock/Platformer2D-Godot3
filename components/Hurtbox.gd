extends Area2D
class_name Hurtbox

export var character_path:NodePath
var character:Character

export var state_machine_path :NodePath
var state_machine:StateMachine

export var sprite_path:NodePath
var sprite:Sprite

export var health:float = 100.0
export var stun_timer:float = 2.0

var time_elapsed = 0

onready var collision:CollisionShape2D = $CollisionShape2D
onready var invulnerability_timer:Timer = $InvulnerabilityTimer
onready var tinter_timer:Timer = $TinterTimer


## puede ser invulnerable momentaneamente
export var can_invulnerable:bool = false

var is_invulnerable:bool = false


func _ready():
	state_machine = get_node(state_machine_path) as StateMachine
	character = get_node(character_path) as Character
	sprite = get_node(sprite_path) as Sprite
	
	invulnerability_timer.wait_time = stun_timer
	invulnerability_timer.one_shot = true

func take_damage(attack:Attack):
	
	if health > 0:
		health -= attack.attack_damage
		
		var dir:Vector2 = (attack.attack_position - global_position).normalized()
		if dir.x >= 0:
			dir += Vector2(1,0)
		else:
			dir += Vector2(-1,0)
		#character.knockback_dir = ((attack.attack_position - global_position).normalized() + Vector2(1,0))* attack.knockback_force
		character.knockback_dir = dir * attack.knockback_force
		
		print("Player Knockback_dir: ", character.knockback_dir)
		state_machine.change_state("Hit")
		
		is_invulnerable = true
		set_collision_layer_bit(0, false)
		tinter_timer.start()
		invulnerability_timer.start()
		
		if health <= 0:
			state_machine.change_state("Dead")
		


func _on_InvulnerabilityTimer_timeout():
	tinter_timer.stop()
	is_invulnerable = false
	sprite.visible = true
	set_collision_layer_bit(0, true)
	time_elapsed = 0


func _on_TinterTimer_timeout():
	sprite.visible = !sprite.visible
