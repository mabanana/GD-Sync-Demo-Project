class_name PlayerController
extends Node

@onready var _username: Label

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
#	Expose all functions that may be called remotely
	GDSync.expose_func(attack)
	GDSync.expose_func(apply_damage)
	GDSync.expose_func(damage)
	set_multiplayer_data.call_deferred()

func set_multiplayer_data():
	var client_id : int = name.to_int()
	
#	Display the username of this client
	_username.text = GDSync.get_player_data(client_id, "Username", "Unknown")
	
#	Make sure to only display the username of OTHER players, not yourself
	_username.visible = !GDSync.is_gdsync_owner(self)

func _physics_process(delta: float) -> void:
	pass

func attack() -> void:
	pass

func damage() -> void:
	pass

func apply_damage():
	pass

