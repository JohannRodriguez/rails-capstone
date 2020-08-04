require 'test_helper'

class SaveArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get save_articles_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get save_articles_destroy_url
    assert_response :success
  end
end
