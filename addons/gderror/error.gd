@tool
class_name Error extends RefCounted

var code: int
var message: String

func _init(_code: int, _message: String = ""):
	assert(_code > 0, "Please pass a non-zero error code.")
	message = _message
	code = _code

func _to_string() -> String:
	return code_to_string(code) + ": " + message

static func wrap(err: Error, code: int = -1, message: String = ""):
	if code == -1:
		code = err.code
	if message == "":
		message = err.message
	else:
		message += " (" + code_to_string(err.code) + ": " + err.message + ")"
	return Error.new(code, message)

static func not_implemented():
	return Error.new(ERR_BUG, "Not implemented")

static func code_to_string(code: int) -> String:
	match code:
		OK:
			return "OK"
		FAILED:
			return "FAILED"
		ERR_UNAVAILABLE:
			return "ERR_UNAVAILABLE"
		ERR_UNCONFIGURED:
			return "ERR_UNCONFIGURED"
		ERR_UNAUTHORIZED:
			return "ERR_UNAUTHORIZED"
		ERR_PARAMETER_RANGE_ERROR:
			return "ERR_PARAMETER_RANGE_ERROR"
		ERR_OUT_OF_MEMORY:
			return "ERR_OUT_OF_MEMORY"
		ERR_FILE_NOT_FOUND:
			return "ERR_FILE_NOT_FOUND"
		ERR_FILE_BAD_DRIVE:
			return "ERR_FILE_BAD_DRIVE"
		ERR_FILE_BAD_PATH:
			return "ERR_FILE_BAD_FILE"
		ERR_FILE_NO_PERMISSION:
			return "ERR_FILE_NO_PERMISSION"
		ERR_FILE_ALREADY_IN_USE:
			return "ERR_FILE_ALREADY_IN_USE"
		ERR_FILE_CANT_OPEN:
			return "ERR_FILE_CANT_OPEN"
		ERR_FILE_CANT_WRITE:
			return "ERR_FILE_CANT_WRITE"
		ERR_FILE_CANT_READ:
			return "ERR_FILE_CANT_READ"
		ERR_FILE_UNRECOGNIZED:
			return "ERR_FILE_UNRECOGNIZED"
		ERR_FILE_CORRUPT:
			return "ERR_FILE_CORRUPT"
		ERR_FILE_MISSING_DEPENDENCIES:
			return "ERR_FILE_MISSING_DEPENDENCIES"
		ERR_FILE_EOF:
			return "ERR_FILE_EOF"
		ERR_CANT_OPEN:
			return "ERR_CANT_OPEN"
		ERR_CANT_CREATE:
			return "ERR_CANT_CREATE"
		ERR_QUERY_FAILED:
			return "ERR_QUERY_FAILED"
		ERR_ALREADY_IN_USE:
			return "ERR_ALREADY_IN_USE"
		ERR_LOCKED:
			return "ERR_LOCKED"
		ERR_TIMEOUT:
			return "ERR_TIMEOUT"
		ERR_CANT_CONNECT:
			return "ERR_CANT_CONNECT"
		ERR_CANT_RESOLVE:
			return "ERR_CANT_RESOLVE"
		ERR_CONNECTION_ERROR:
			return "ERR_CONNECTION_ERROR"
		ERR_CANT_ACQUIRE_RESOURCE:
			return "ERR_CANT_ACQUIRE_RESOURCE"
		ERR_CANT_FORK:
			return "ERR_CANT_FORK"
		ERR_INVALID_DATA:
			return "ERR_INVALID_DATA"
		ERR_INVALID_PARAMETER:
			return "ERR_INVALID_PARAMETER"
		ERR_ALREADY_EXISTS:
			return "ERR_ALREADY_EXISTS"
		ERR_DOES_NOT_EXIST:
			return "ERR_DOES_NOT_EXIST"
		ERR_DATABASE_CANT_READ:
			return "ERR_DATABASE_CANT_READ"
		ERR_DATABASE_CANT_WRITE:
			return "ERR_DATABASE_CANT_WRITE"
		ERR_COMPILATION_FAILED:
			return "ERR_COMPILATION_FAILED"
		ERR_METHOD_NOT_FOUND:
			return "ERR_METHOD_NOT_FOUND"
		ERR_LINK_FAILED:
			return "ERR_LINK_FAILED"
		ERR_SCRIPT_FAILED:
			return "ERR_SCRIPT_FAILED"
		ERR_CYCLIC_LINK:
			return "ERR_CYCLIC_LINK" 
		ERR_INVALID_DECLARATION:
			return "ERR_INVALID_DECLARATION"
		ERR_DUPLICATE_SYMBOL:
			return "ERR_DUPLICATE_SYMBOL"
		ERR_PARSE_ERROR:
			return "ERR_PARSE_ERROR"
		ERR_BUSY:
			return "ERR_BUSY"
		ERR_SKIP:
			return "ERR_SKIP"
		ERR_HELP:
			return "ERR_HELP"
		ERR_BUG:
			return "ERR_BUG"
		ERR_PRINTER_ON_FIRE:
			return "ERR_PRINTER_ON_FIRE"
		_:
			return "UNKNOWN"
