extends Node
class_name PlayerStats


var shielding:bool = false

var base_health:int = 15
var base_mana:int = 10
var base_magic_attack:int = 3

var base_attack:int = 1
var base_defense:int = 1


var bonus_base_health:int = 0
var bonus_base_mana:int = 0
var bonus_base_magic_attack:int = 0

var bonus_base_attack:int = 0
var bonus_base_defense:int = 0

var current_health
var current_mana

var max_health
var max_mana


var current_exp : int = 0

var level:int = 1

var level_dict = {
	"1": 25,
	"2": 33,
	"3": 49,
	"4": 66,
	"5": 93,
	"6": 135,
	"7": 186,
	"8": 251,
	"9": 356
}


func _ready():
	current_mana = base_mana + bonus_base_mana
	max_mana = current_mana
	
	current_health = base_health + bonus_base_health
	max_health = current_health
	
	
	
func update_exp(value:int):
	current_exp += value
	if current_exp >= level_dict[str(level)] and level < 9:
		var leftover:int = current_exp - level_dict[str(level)]
		current_exp = leftover
		on_level_up()
		level += 1
		
	elif current_exp >= level_dict[str(level)] and level == 9:
		current_exp = level_dict[str(level)]
		
func on_level_up():
	current_mana = base_mana + bonus_base_mana
	current_health = base_health + bonus_base_health
	
	
func update_health(type: String, value: int):
	match type:
		"increase":
			current_health += value
			current_health = clamp(current_health, 0, max_health)
			
		"decrease":
			verify_shield(value)
			
			if current_health <= 0:
				pass # animacion muerte
			else:
				pass #animacion hit
			
			
func verify_shield(value:int):
	if shielding:
		if (base_defense + bonus_base_defense) >= value:
			return
			
		var damage:int = abs((base_defense + bonus_base_defense) - value)
		current_health -= damage
		
	else:
		current_health -= value
			
func update_mana(type:String, value:int):
	match type:
		"increase":
			current_mana += value
			if current_mana >= max_mana:
				current_mana = max_mana
				
		"decrease":
			current_mana -= value
			
		

	
