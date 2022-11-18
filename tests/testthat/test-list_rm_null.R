describe("list_rm_null()", {
  it("list_rm_null removes the NULLS for an input list", {
    # Arrange
    
    expected_result <- list(a = 2, b = "three")
    input_list <- append(expected_result, c(NULL, null_value = NULL))

    # Act
    result <- list_rm_null(input_list)

    # Assert
    expect_equal(result, expected_result)
  })
})
