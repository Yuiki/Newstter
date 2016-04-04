require 'test_helper'

class ApplicationTest < ActionDispatch::IntegrationTest
  test "render an error if page not found" do
    get "/hoge/fuga/piyo"
    assert_select "h2", "404 Not Found"
  end
end
