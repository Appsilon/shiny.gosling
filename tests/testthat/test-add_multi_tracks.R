describe("add_multi_tracks()", {
  it("Calls the json_list function and returns the expected output", {
    # Arrange
    result_json_list <- TRUE
    mocked_json_list <- mockery::mock(result_json_list)
    mockery::stub(add_multi_tracks, "json_list", mocked_json_list)

    # Act
    result <- add_multi_tracks()

    # Assert
    expect_equal(result, result_json_list)
    mockery::expect_called(mocked_json_list, 1)
  })

})
