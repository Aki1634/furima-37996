require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get furima_index_url
    assert_response :success
  end
end
