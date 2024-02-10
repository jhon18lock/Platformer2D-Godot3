extends Area2D



func _on_Hitbox_area_entered(area):
	if area is Hurtbox:
		var new_attack = Attack.new()
		new_attack.attack_damage = 10.0
		new_attack.attack_position = self.global_position + Vector2(10,0)
		new_attack.knockback_force = 15.0
	
		area.take_damage(new_attack)
