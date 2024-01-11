@tool
class_name ErrorReturn extends RefCounted

var value
var error: Error

func get_value():
	return value

func _init(_value, _error: Error):
	value = _value
	error = _error

func is_ok() -> bool:
	return error == null or error.code == OK

func is_error() -> bool:
	return error != null and error.code != OK
