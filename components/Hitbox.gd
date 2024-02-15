extends Area2D
class_name Hitbox

export(NodePath) onready var state_machine = get_node(state_machine) as StateMachine

export(NodePath) onready var character = get_node(character) as Character

export var damage:float = 0
export var knockback_force = 0

func _on_Hitbox_area_entered(area):
	if area is Hurtbox:
		var new_attack = Attack.new()
		new_attack.attack_damage = damage
		new_attack.attack_position = self.global_position
		new_attack.knockback_force = knockback_force
	
		area.take_damage(new_attack)
		
	
func take_knockback(kb:Parry):
	
	character.knockback_dir = ((kb.position - global_position).normalized() + Vector2(1,0))* kb.knockback_force
	state_machine.change_state("Hit")
