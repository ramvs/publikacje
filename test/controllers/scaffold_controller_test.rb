require 'test_helper'

class ScaffoldControllerTest < ActionController::TestCase
  test "should get PublicationSubtypes" do
    get :PublicationSubtypes
    assert_response :success
  end

end
