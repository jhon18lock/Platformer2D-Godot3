extends Area2D

class_name Parrybox

export var knockback_force:float = 0



func _on_Parrybox_area_entered(area):
	if area is Hitbox:
		var new_parry = Parry.new()
		new_parry.knockback_force = self.knockback_force
		new_parry.position = self.global_position
		
		area.take_knockback(new_parry)
