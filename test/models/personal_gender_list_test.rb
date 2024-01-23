require "test_helper"

class PersonalGenderListTest < ActiveSupport::TestCase
  def setup
    @gender = PersonalGenderList.new(jenis_kelamin: "Laki-laki")
  end
  test "should accept for right information" do
    assert @gender.valid?
  end
  test "should reject for blank gender" do
    @gender.jenis_kelamin = " "
    assert_not @gender.valid?
  end
  test "should reject for non unique gender" do
    @gender.jenis_kelamin = personal_gender_lists(:one)
    assert_not @gender.valid?
  end
  test "should reject for too long gender" do
    @gender.jenis_kelamin = "a" * 11
    assert_not @gender.valid?
  end
  test "should reject for too short gender" do
    @gender.jenis_kelamin = "a" * 3
    assert_not @gender.valid?
  end
end
