# frozen_string_literal: true

require 'test_helper'

class AddressKabupatenListTest < ActiveSupport::TestCase
  def setup
    @address_kabupaten =
      AddressKabupatenList.new(kabupaten: 'toba',
                               address_province_list_id: address_province_lists(:aceh).id)
  end
  test 'should be valid kabupaten' do
    assert @address_kabupaten.valid?
  end
  test 'kabupaten should be present' do
    @address_kabupaten.kabupaten = ' '
    assert_not @address_kabupaten.valid?
  end
  test 'kabupaten should be unique' do
    duplicate_kabupaten = @address_kabupaten.dup
    @address_kabupaten.save
    assert_not duplicate_kabupaten.valid?
  end
  test 'should reject for too long kabupaten' do
    @address_kabupaten.kabupaten = 'a' * 36
    assert_not @address_kabupaten.valid?
  end
  test 'should reject for too short kebupaten' do
    @address_kabupaten.kabupaten = 'a' * 2
    assert_not @address_kabupaten.valid?
  end
  test 'should reject for nill kecamatan_id' do
    @address_kabupaten.address_province_list_id = nil
    assert_not @address_kabupaten.valid?
  end
end
