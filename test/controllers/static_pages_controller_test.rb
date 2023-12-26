require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  #avoid writing the string "Ruby on Rails Tutorial Sample App" multiple times
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App" #instance variable
  end
  #let's test the home page by using the get method to issue a request for the home page URL
  test "should get home" do  #test that the home page renders successfully
    get static_pages_home_url #access using get request
    assert_response :success #assert that the HTTP response was successful
    #test title of home page
    assert_select "title", "Home | #{@base_title}" #assert_select to test for the presence of a particular HTML tag
  end
  #let's test the help page by using the get method to issue a request for the help page URL
  test "should get help" do
    get static_pages_help_url
    assert_response :success
    #test title of help page
    assert_select "title","Help | #{@base_title}"
  end
  #TDD: write falling test for about pages
  test  "should get about" do
    get static_pages_about_url
    assert_response :success
    #test title of about page
    assert_select "title","About | #{@base_title}"
  end
  #TDD: write falling test for contact
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    #test title of contact page
    assert_select "title","Contact | #{@base_title}"
  end
  #test root route
  test "should get root" do
    get root_url
    assert_response :success
  end
end
