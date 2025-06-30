class_name personaje
extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var gravity = 1000 # La gravedad suele ser un valor más alto.
@export var jump_velocity = -400 # Velocidad de salto, negativa para ir hacia arriba.

func _physics_process(delta):
	# Manejo de la gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Salto
	if Input.is_action_just_pressed("Atras") and is_on_floor(): # Solo salta si está en el suelo
		velocity.y = jump_velocity # Asigna la velocidad de salto directamente

	# Movimiento horizontal
	var direction_x = Input.get_axis("Izquierda", "Derecha")
	if direction_x: # Si hay dirección (izquierda o derecha)
		velocity.x = direction_x * speed # Asigna la velocidad en X
	else:
		velocity.x = move_toward(velocity.x, 0, speed) # Reduce la velocidad a 0 si no hay input

	move_and_slide()
