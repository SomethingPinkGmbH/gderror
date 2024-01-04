# GDScript error handling

This repository contains error handling utilities for GDScript. 

## Error class

The `Error` class provides the ability to ship an error message alongside an error code.

```gdscript
func my_function() -> Error:
	return Error.new(
		ERR_INVALID_DATA,
		"The data you provided is invalid."
	)
```

You can also return `null` to indicate that no error happened.

## Error returns

When you need to return a value along with an error code, you can also use the `ErrorReturn` class:
	
```gdscript
func my_function() -> ErrorReturm:
	return ErrorReturn.new(
		"This is a return value",
		null
	)

func my_erroring_function() -> ErrorReturn:
	return ErrorReturn.new(
		null,
		Error.new(
			ERR_INVALID_DATA,
			"The data you provided is invalid."
		)
	)
```

You can then access the values like this:

```gdscript
var data = my_function()
if !data.is_ok():
	print(data.error)
else:
	print(data.value)
```
