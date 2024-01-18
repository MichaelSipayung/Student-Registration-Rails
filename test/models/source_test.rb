require "test_helper"

class SourceTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @source = Source.new(user_id: @user.id, motivasi: 'example', sumber_informasi: 'example', jumlah_n: 1)
  end
  test "should be valid" do
    assert @source.valid?
  end
  test "motivasi should not be to short" do
    @source.motivasi = "a"*3
    assert_not @source.valid?
  end
  test "motivasi should not be to long" do
    @source.motivasi = "a"*31
    assert_not @source.valid?
  end
  test "sumber_informasi should not be to short" do
    @source.sumber_informasi = "a"*3
    assert_not @source.valid?
  end
  test "sumber_informasi should not be to long" do
    @source.sumber_informasi = "a"*31
    assert_not @source.valid?
  end
  test "jumlah_n should not be to short" do
    @source.jumlah_n = 0
    assert_not @source.valid?
  end
  test "jumlah_n should not be to long" do
    @source.jumlah_n = 51
    assert_not @source.valid?
  end

end
