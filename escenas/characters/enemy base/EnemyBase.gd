extends Character

onready var state_machine:StateMachine = $EnemyBaseSM

onready var ray_floor:RayCast2D = $Pivot/RayFloor
onready var ray_wall:RayCast2D = $Pivot/RayWall

var player:Player = null

var player_pos_attack:Vector2 = Vector2()

func _ready():
	direction.x = 1

func _physics_process(delta):
	
	if player != null:
		if player.global_position.x < global_position.x:
			direction.x = -1
		else:
			direction.x = 1
			
		if player.global_position.distance_squared_to(global_position) < 7500:
			if not state_machine.current_state.name in ["Attack", "Hit", "Dead"]:
				state_machine.change_state("Attack")
				player_pos_attack = player.global_position
		#print("Distancia al cuadrado: ", player.global_position.distance_squared_to(global_position))
		
		return
		
	if is_on_floor():
		if not ray_floor.is_colliding(): 
			flip()
			
		if ray_wall.is_colliding():
			if ray_wall.get_collider() is TileMap:
				flip()
		
		
func flip():
	direction.x *= -1


func _on_Detector_body_entered(body):
	if body is Player:
		player = body
		
	
func _on_Detector_body_exited(body):
	if body is Player:
		player = null
