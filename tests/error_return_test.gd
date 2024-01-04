extends GutTest

const DATA = "This is the data"
const ERROR_CODE = ERR_INVALID_DATA
const ERROR_MESSAGE = "The data you provided is invalid"

func nonerroring_function() -> ErrorReturn:
	return ErrorReturn.new(
		DATA,
		null
	)

func erroring_function() -> ErrorReturn:
	return ErrorReturn.new(
		null,
		Error.new(
			ERROR_CODE,
			ERROR_MESSAGE
		)
	)

func test_no_error():
	var data = nonerroring_function()
	assert_null(data.error)
	assert_eq(data.value, DATA)
	
func test_error():
	var data = erroring_function()
	assert_not_null(data.error)
	assert_null(data.value)
	assert_eq(data.error.code, ERROR_CODE)
	assert_eq(data.error.message, ERROR_MESSAGE)
