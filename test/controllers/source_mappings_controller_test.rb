require 'test_helper'

class SourceMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_mapping = source_mappings(:one)
  end

  test "should get index" do
    get source_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_source_mapping_url
    assert_response :success
  end

  test "should create source_mapping" do
    assert_difference('SourceMapping.count') do
      post source_mappings_url, params: { source_mapping: { destination_id: @source_mapping.destination_id, source_id: @source_mapping.source_id } }
    end

    assert_redirected_to source_mapping_url(SourceMapping.last)
  end

  test "should show source_mapping" do
    get source_mapping_url(@source_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_mapping_url(@source_mapping)
    assert_response :success
  end

  test "should update source_mapping" do
    patch source_mapping_url(@source_mapping), params: { source_mapping: { destination_id: @source_mapping.destination_id, source_id: @source_mapping.source_id } }
    assert_redirected_to source_mapping_url(@source_mapping)
  end

  test "should destroy source_mapping" do
    assert_difference('SourceMapping.count', -1) do
      delete source_mapping_url(@source_mapping)
    end

    assert_redirected_to source_mappings_url
  end
end
