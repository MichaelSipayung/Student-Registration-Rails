require "test_helper"
class MicropostTest < ActiveSupport::TestCase
  def after_setup
    @user = users(:michael)
    #new and build return object in memory and it doesn't
    # modify the database
    @micropost= @user.microposts.build(content: "Lorem ipsum")
  end
  test "should be valid" do
    assert @micropost.valid?
  end
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  test "content should be present" do
    @micropost.content  =" "
    assert_not @micropost.valid?
  end
  test "content should be at least 140 characters" do
    @micropost.content  = 'a'*141
    assert_not @micropost.valid?
  end
  #compare most recent added from fixture
  test " order should be most recent most" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
