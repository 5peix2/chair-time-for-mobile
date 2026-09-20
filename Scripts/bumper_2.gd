extends Sprite2D

var hit: bool = false
var direction: Vector2
@export var speed: float

func _ready() -> void:
	await get_tree().create_timer(30).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta * direction * speed



func _on_area_2d_body_entered(body: Node2D) -> void:
	if !hit:
		hit = true
		body.get_node("../..").get_hit()
