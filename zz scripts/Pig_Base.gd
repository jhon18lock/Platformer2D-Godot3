extends KinematicBody2D
class_name PigBase

var direction: Vector2 = Vector2()
var velocity:Vector2

export var speed:float
export var gravity:float

export var lifes:int

onready var detect_left_map = $left_map
onready var detect_right_map = $right_map
onready var detect_left_player = $left_player
onready var detect_right_player = $right_player

var temp_jump_right:int
var temp_jump_left:int

onready var state_machine = get_node("PigStateMachine")

func _ready():
	add_to_group("Enemy")
	state_machine.character = self

func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_ceiling():
		velocity.y = 0
	if is_on_floor():
		velocity.y = 0
		
	var detect_col = detect_collision()
	
	if detect_col != null:
		#print("Raycast enemy: ", detect_col.name)
		if detect_col.is_in_group("Player") and detect_col.global_position.distance_to(global_position) < 25:
			if not detect_col.state_machine.current_state.name in ["Dead", "Hit"] and not state_machine.current_state.name in ["Attack", "Dead", "Hit"]:
				state_machine.change_state("Attack")
				# se puede pasar como una clase attack
				var dir = (detect_col.global_position - global_position).normalized()
				detect_col.knockback_dir = dir
				
				detect_col.state_machine.change_state("Hit")
	
		
func detect_collision():
	var player
	var friend
	
	if get_node("time_move").is_stopped():
		#print("Timer PIG se detuvo")
		direction.x = 0
	
	if detect_right_player.is_colliding():
		if detect_right_player.get_collider().is_in_group("Player"):
			player = detect_right_player.get_collider()
			direction.x = 1
			get_node("time_move").start()
			#print("SE inicia timer pig derecha")
			return player
		elif detect_right_player.get_collider().is_in_group("Enemies"):
			
			friend = detect_right_player.get_collider()
			if friend.global_position.distance_to(global_position) < 25:
				direction.x = -1
				get_node("time_move").start()
			
	if detect_left_player.is_colliding():
		if detect_left_player.get_collider().is_in_group("Player"):
			player = detect_left_player.get_collider()
			direction.x = -1
			get_node("time_move").start()
			#print("se inicia timer pig izquierda")
			return player
			
		elif detect_left_player.get_collider().is_in_group("Enemies"):
			
			friend = detect_left_player.get_collider()
			if friend.global_position.distance_to(global_position) < 25:
				direction.x = 1
				get_node("time_move").start()
				
	# solamente si tiene una caja
	if state_machine.current_state.name == "IdleBox":
		return null
		
		
	if detect_right_map.is_colliding():
		if detect_right_map.get_collider() is TileMap:
			if not get_node("time_move").is_stopped():
				if velocity.y == 0:
					if temp_jump_right == 2:
						direction.x = -1
						get_node("time_move").start()
						return
					state_machine.change_state("Jump")
					temp_jump_right += 1
					get_node("time_move").start()
	else:
		temp_jump_right = 0
		
	if detect_left_map.is_colliding():
		if detect_left_map.get_collider() is TileMap:
			if not get_node("time_move").is_stopped():
				if velocity.y == 0:
					if temp_jump_left == 2:
						direction.x = 1
						get_node("time_move").start()
						return
					state_machine.change_state("Jump")
					temp_jump_left += 1
					get_node("time_move").start()
	else:
		temp_jump_left = 0
		
