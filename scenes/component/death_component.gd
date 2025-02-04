extends Node2D

@export var health_component: Node
@export var sprite: Sprite2D

func _ready():
  $GPUParticles2D.texture = sprite.texture
  health_component.died.connect(on_died)

func on_died():
  if owner == null|| not owner is Node2D:
    return
  var spawn_position = owner.global_position
  var tree = get_tree()
  get_parent().remove_child(self)

  var entities = tree.get_first_node_in_group("entities_layer")
  entities.add_child(self)
  global_position = spawn_position
  $AnimationPlayer.play("Default")
