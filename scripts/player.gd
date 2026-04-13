extends Area2D
@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("down"):
		velocity.y +=1
	if Input.is_action_pressed("up"):
		velocity.y -=1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("rigth"):
		velocity.x +=1
	if velocity.length() > 0 : 
		velocity = velocity.normalized()*speed
		$AnimatedSprite2D.play()
	else : 
		$AnimatedSprite2D.stop()
	position += delta*velocity
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0 and velocity.y < 0 :
		$AnimatedSprite2D.animation = "up"
	elif velocity.y !=0 and velocity.y >0 :
		$AnimatedSprite2D.animation = "down"	
	pass
