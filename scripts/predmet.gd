extends Area2D

var pokupljen: bool = false


func _ready() -> void:
	pokupljen = false
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("igrac") and not pokupljen:
		pokupljen = true
		print("Pokupio si predmet!")
		queue_free()
