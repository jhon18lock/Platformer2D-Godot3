extends Node
class_name StateMachine
#nombre de la clase para poder heredar

#nodo entero (personaje o enemigo)
var character

var states:Dictionary = {}

var current_state
var active:bool

func _ready():
	character = owner
	#este mismo - owner
	# owner - el padre de este nodo
	# seria el KinematicBody ( Rey - Cerdo - etc )
	
	active = true
	get_states()
	change_state("Idle")
	
#Obtener nodos estados dinamicamente
func get_states():
	for state_node in get_children():
		if state_node in states:
			continue
		states[state_node.name] = state_node
		states[state_node.name].state_machine = self
		states[state_node.name].character = character
		states[state_node.name].anim_character = character.get_node("Animation")
		states[state_node.name].speed = character.speed
		states[state_node.name].velocity = character.velocity
		states[state_node.name].direction = character.direction
		#states[state_node.name].enter()
	pass
	
func _input(event):
	if active == false:
		return
	current_state.handle_input(event) #funcion nuestra
	
func _physics_process(delta):
	if active == false:
		return
	current_state.physics(delta) #funcion nuestra

func change_state(state_name):
	if active == false:
		return
	if state_name in states:
		if current_state != null:
			current_state.exit()
		current_state = states[state_name]
		
		current_state.enter()
