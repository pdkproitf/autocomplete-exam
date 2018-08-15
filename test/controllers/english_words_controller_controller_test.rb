require 'test_helper'

class EnglishWordsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get english_words_controller_search_url
    assert_response :success
  end

end
