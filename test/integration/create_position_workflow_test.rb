require "test_helper"

class CreatePositionWorkflowTest < ActionDispatch::IntegrationTest

    test "should try to create a new position" do
        get "/positions/new"
        assert_response :success

        post "/positions", params: {position: {title: "Product Engineer", description: "Labore et dolore magna aliqua"}}
        assert_response :found
        assert_select 'a', "redirected"

        get "/positions"
        assert_response :ok
        puts(response.parsed_body)
        assert_select "div div", 3
        assert_select "div div p", "Title: Product Engineer"
        assert_select "div div p", "Labore et dolore magna aliqua"
    end

end