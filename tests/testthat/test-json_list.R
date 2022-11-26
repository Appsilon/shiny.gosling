describe("json_list()", {
  it("Returns a named list when passing named parameters", {
    # Arrange
    expected_result <- list(a = 2, b = "three")

    # Act
    result <- json_list(a = 2, b = "three")

    # Assert
    expect_equal(result, expected_result)
  })
})
