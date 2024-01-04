extends GutTest

const ERROR_CODE = ERR_INVALID_DATA
const ERROR_MESSAGE = "The data you provided is invalid"

func nonerroring_function() -> Error:
	return null

func erroring_function() -> Error:
	return Error.new(
		ERROR_CODE,
		ERROR_MESSAGE
	)

func test_no_error():
	assert_null(nonerroring_function())

func test_error():
	var err = erroring_function()
	assert_eq(err.code, ERROR_CODE)
	assert_eq(err.message, ERROR_MESSAGE)
	assert_string_contains(err.to_string(), Error.code_to_string(ERROR_CODE))
	assert_string_contains(err.to_string(), ERROR_MESSAGE)
