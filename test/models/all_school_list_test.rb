require "test_helper"

class AllSchoolListTest < ActiveSupport::TestCase
  def setup
    @all_school = AllSchoolList.new(sekolah: 'sma pelita')
  end
  test "should accept the right school" do
    assert @all_school.valid?
  end
  test "should reject for empty school list" do
    @all_school.sekolah  =  ''
    assert_not @all_school.valid?
  end
  test "should reject for too short school name" do
    @all_school.sekolah = 'a'*4
    assert_not @all_school.valid?
  end
  test "should reject for too long school name" do
    @all_school.sekolah = 'a'*36
    assert_not @all_school.valid?
  end
  test "should reject for non unique school name" do
    @all_school.sekolah = all_school_lists(:one).sekolah
    assert_not @all_school.valid?
  end
end
