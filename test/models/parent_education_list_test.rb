require "test_helper"

class ParentEducationListTest < ActiveSupport::TestCase
  def setup
    @education = ParentEducationList.new(pendidikan: 'sd')
  end
  test "should accept the right education" do
    assert @education.valid?
  end
  test "should reject for empty education" do
    @education.pendidikan=''
    assert_not @education.valid?
  end
  test "should reject for too short education" do
    @education.pendidikan='a'
    assert_not @education.valid?
  end
  test "should reject for too long education" do
    @education.pendidikan='q'*21
    assert_not @education.valid?
  end
  test "should reject for non unique education" do
    @education.pendidikan= parent_education_lists(:one)
    assert_not @education.valid?
  end
end
