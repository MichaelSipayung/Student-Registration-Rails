require "test_helper"
class LanguageTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @language = Language.new(user_id: @user.id, nama_bahasa: 'example', tingkat: 'example')
  end
  test "should be valid" do
    assert @language.valid?
  end
  test "nama_bahasa should not be to short" do
    @language.nama_bahasa = "a"*3
    assert_not @language.valid?
  end
  test "nama_bahasa should not be to long" do
    @language.nama_bahasa = "a"*21
    assert_not @language.valid?
  end
  test "tingkat should not be to short" do
    @language.tingkat = "a"*3
    assert_not @language.valid?
  end
  test "tingkat should not be to long" do
    @language.tingkat = "a"*21
    assert_not @language.valid?
  end
end
