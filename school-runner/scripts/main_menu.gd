extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.modulate.a = 0
	
	var tween = create_tween()
	tween.tween_property($Background, "modulate:a", 0.5, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_texture_button_3_pressed() -> void:
	get_tree().quit()


func _on_texture_button_2_pressed() -> void:
	pass # Replace with function body.
