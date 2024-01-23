require "test_helper"

class PersonalReligionListTest < ActiveSupport::TestCase
  def setup
    @religion = PersonalReligionList.new(agama: 'protestan')
  end
  test "should accept the religion list" do
    assert @religion.valid?
  end
  test "should reject religion if it too short" do
    @religion.agama ='a'*3
    assert_not @religion.valid?
  end
  test "should reject religion if too long" do
    @religion.agama = 'a'*21
    assert_not @religion.valid?
  end
  test "should reject duplicate religion" do
    @religion.agama  = personal_religion_lists(:one)
    assert_not @religion.valid?
  end
  test "should reject an empty religion" do
    @religion.agama =''
    assert_not @religion.valid?
  end
end
