require "test_helper"

class AddressProvinceListTest < ActiveSupport::TestCase
  def after_setup
    @province  = AddressProvinceList.new(provinsi: 'jawa barat')
  end
  test "should accept right province" do
    assert @province.valid?
  end
  test "should reject empty province" do
    @province.provinsi = ''
    assert_not @province.valid?
  end
  test "should reject duplicate province" do
    @province.save
    @province2 = AddressProvinceList.new(provinsi: 'jawa barat')
    assert_not @province2.valid?
  end
  test "should reject for too short province" do
    @province.provinsi = 'a'*2
    assert_not @province.valid?
  end
  test "should reject for too long province" do
    @province.provinsi = 'a'*36
    assert_not @province.valid?
  end
end
