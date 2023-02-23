extends CharacterBody2D

@export var speed: float = 100.0

# referência a objetos
@export var sprite: Sprite2D = null
@export var animation: AnimationPlayer = null

func _physics_process(_delta):
	var direction: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"), # movimentação no eixo X
		Input.get_axis("ui_up", "ui_down"), # movimentação no eixo Y
	).normalized() # equiparar a movimentação no eixo X e Y com a movimentação na diagonal
	
	velocity = speed * direction # para move_and_slide reconhecer a varíavel tem que ter nome 'velocity' ((LOUCURA))
	move_and_slide() # recebe velocity por parâmetro automaticamente ((LOUCURA))
		
	check_orientation()
	animate()
## end _physics_process

# Inverte o sprite dependendo da direção no eixo X
func check_orientation():
	if (velocity.x > 0):
		sprite.flip_h = false
		
	if (velocity.x < 0):
		sprite.flip_h = true
## end check_orientation
	
# Roda a animação do personagem caso esteja em movimento
func animate():
	if (velocity != Vector2.ZERO):
		animation.play("running(X)")
		return
	
	animation.play("idle")
## end animate
