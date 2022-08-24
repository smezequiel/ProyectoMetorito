#Player.gd
class_name Player
extends RigidBody2D

#Atributos export
export var potencia_motor:int = 400		#export era para que podamos modificarlo en la pagina del personaje
export var potencia_rotacion:int = 1200

#Atributos
var empuje:Vector2 = Vector2.ZERO
var dir_rotacion:int = 0

#Atributos Onready
onready var canion:Canion = $Canion

#Metodos 
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
		apply_central_impulse(empuje.rotated(rotation))		#si lo dejamos como estaba, la nave se movia horizontal. Entonces rotamos la nave
		#el agregado de empuje.rotated(rotation) nos permite que la nave gire y avance. sino gira y se mueve en el plano horizontal.
		apply_torque_impulse(dir_rotacion * potencia_rotacion)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	player_input()
	
func player_input() -> void:
	#Empuje
	empuje = Vector2.ZERO
	if Input.is_action_pressed("mover_adelante"):
		empuje = Vector2(potencia_motor,0)
	elif Input.is_action_pressed("mover_atras"):
		empuje = Vector2(-potencia_motor,0)
		
	#Rotacion
	dir_rotacion = 0
	if Input.is_action_pressed("rotar_antihorario"):
		dir_rotacion -= 1
	elif Input.is_action_pressed("rotar_horario"):
		dir_rotacion += 1
	
	#Disparo
	if Input.is_action_pressed("disparo_principal"):
		canion.set_esta_disparando(true)
		
	if Input.is_action_just_released("disparo_principal"):
		canion.set_esta_disparando(false)

