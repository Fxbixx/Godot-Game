extends Node2D

var score := 0
var score_multi = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().create_timer(0.8).timeout.connect(ScoreIncrease)
	get_tree().create_timer(5).timeout.connect(MultiIncrease)
	$CanvasLayer/Death.visible = false
	$CanvasLayer/TextureButton.visible = false
	$CanvasLayer/TextureButton2.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Score.text = "Score: " + str(score)
	
	
	
func ScoreIncrease(): #Recursive clocking
	score += score_multi
	get_tree().create_timer(0.8).timeout.connect(ScoreIncrease)
	
func MultiIncrease(): #Recursive clocking
	score_multi += 1
	get_tree().create_timer(10).timeout.connect(MultiIncrease)


func _on_texture_button_2_pressed() -> void:  #Death Scene Start
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_texture_button_pressed() -> void: #Death Scene Quit
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
