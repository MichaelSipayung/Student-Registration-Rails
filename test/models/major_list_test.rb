require "test_helper"

class MajorListTest < ActiveSupport::TestCase
  def setup
    @major = MajorList.new(jurusan: 'sistem informasi')
  end
  test "should accept for right major" do
    assert @major.valid?
  end
  test "should reject for major less than 4" do
    @major.jurusan='j'*3
    assert_not @major.valid?
  end
  test "should reject for empty major" do
    @major.jurusan=''
    assert_not @major.valid?
  end
  test "should reject for major greater than 25" do
    @major.jurusan ='a'*31
    assert_not @major.valid?
  end
  test "should reject for non unique major" do
    @major = MajorList.new(jurusan: major_lists(:one).jurusan)
    assert_not @major.valid?
  end
end
