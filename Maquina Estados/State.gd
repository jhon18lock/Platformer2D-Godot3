extends Node
class_name State
#este script tendra todos los estados

#aqui se contendra un nodo entero
var state_machine:Node
var character:Character

var anim_character:AnimationPlayer

var speed:float
var velocity:Vector2
var direction:Vector2

func enter():
	pass
	
func handle_input(_event):
	pass
	
func physics(_delta):
	pass
	
func get_direction():
	direction = character.direction
	
	if character.is_in_group("Player"):
		direction.x = 0
		if Input.is_action_pressed("ui_left"):
			direction.x = -1
		if Input.is_action_pressed("ui_right"):
			direction.x = 1
			
	if direction.x != 0:
		character.get_node("Pivot").scale.x = direction.x
			
func move():
	velocity.x = character.speed * direction.x
	character.velocity.x = velocity.x

func exit():
	pass
