describe("add_single_track()", {
  it("Calls the expected functions and returns the expected object", {
    # Arrange
    result_add_mark <- "add_mark"
    mocked_add_mark <- mockery::mock(result_add_mark)
    mockery::stub(add_single_track, "add_mark", mocked_add_mark)

    result_atomic_values_to_list <- "atomic_values_to_list"
    mocked_atomic_values_to_list <- mockery::mock(result_atomic_values_to_list, cycle = TRUE)
    mockery::stub(add_single_track, "atomic_values_to_list", mocked_atomic_values_to_list)
    expected_result <- replicate(3, result_atomic_values_to_list)

    # Act
    result <- add_single_track()
    # Assert
    mockery::expect_called(mocked_add_mark, 1)
    mockery::expect_called(mocked_atomic_values_to_list, 3)
    expect_equal(result, expected_result)
  })
})
