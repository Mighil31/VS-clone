extends Node

@export var end_screen_scene: PackedScene

func _ready():
  $%Player.health_component.died.connect(on_player_died)
  
func on_player_died():
  var end_scene_instance = end_screen_scene.instantiate()
  add_child(end_scene_instance)
  end_scene_instance.set_defeat()
  
