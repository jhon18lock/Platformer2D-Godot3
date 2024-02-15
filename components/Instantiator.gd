extends Node2D

var drop_bonus:int = 1

var drop_list:Dictionary = {}

func _ready():
	randomize()
	
	drop_list = {
		"Heal Potion": 
			["res://assets/item/consumable/health_potion.png",
			20,
			"Health",
			5,
			2],
		
		"Mana Potion":
			["res://assets/item/consumable/mana_potion.png",
			15,
			"Mana",
			5,
			2],
			
			
		"Whale Mouth":
			["res://assets/item/resource/whale/whale_mouth.png",
			45,
			"Resource",
			{},
			2],
			
		"Whale Eye":
			["res://assets/item/resource/whale/whale_eye.png",
			15,
			"Resource",
			{},
			6],
			
		"Whale Tail":
			["res://assets/item/resource/whale/whale_tail.png",
			3,
			"Resource",
			{},
			25],
			
		"Whale Mask":
			["res://assets/item/equipment/whale_mask.png",
			3,
			"Equipment",
			{
				"Mana":5,
				"Magic Attack":3
			},
			30]
	}

func spawn_item_probability():
	var random_number:int = randi() % 21 #num aleatorio entre 0 y 20
	
	if random_number <= 6:
		drop_bonus = 1
	elif random_number >= 7 and random_number <= 13:
		drop_bonus = 2
	else:
		drop_bonus = 3
	
	print("Instantiator - Multiplicador drop: ", drop_bonus)

	for key in drop_list.keys():
		var rng:int = randi() % 100 + 1
		
		if rng <= drop_list[key][1] * drop_bonus:
			var item_texture:StreamTexture = load(drop_list[key][0])
			var item_info:Array = [
				drop_list[key][0], 
				drop_list[key][2], 
				drop_list[key][3], 
				drop_list[key][4], 
				1]
			
		pass











