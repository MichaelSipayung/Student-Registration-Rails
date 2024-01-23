require "test_helper"

class LanguageNameListTest < ActiveSupport::TestCase
  def setup
    @language_degree = LanguageNameList.new(bahasa: 'cina')
  end
  test "should accept the right language" do
    assert @language_degree.valid?
  end
  test "should reject for too short language name" do
    @language_degree.bahasa ='a'*2
    assert_not @language_degree.valid?
  end
  test "should reject for too long language name" do
    @language_degree.bahasa ='a'*16
    assert_not @language_degree.valid?
  end
  test "should reject for non unique language name" do
    @language_degree.bahasa = language_name_lists(:one)
    assert_not @language_degree.valid?
  end
  test "should reject for empty language name" do
    @language_degree.bahasa = ' '
    assert_not @language_degree.valid?
  end
end
