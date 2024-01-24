require "test_helper"

class AccreditationSchoolListTest < ActiveSupport::TestCase
  def setup
    @accreditation = AccreditationSchoolList.new(akreditasi: 'A')
  end
  test "should accept for valid accreditation" do
    assert @accreditation.valid?
  end
  test "should reject for empty accreditation" do
    @accreditation.akreditasi = ''
    assert_not @accreditation.valid?
  end
  test "should reject for too long accreditation " do
    @accreditation.akreditasi ='a'*16
    assert_not @accreditation.valid?
  end
  test "should reject for non unique accreditation" do
    @accreditation.akreditasi = accreditation_school_lists(:one).akreditasi
    assert_not @accreditation.valid?
  end
end
