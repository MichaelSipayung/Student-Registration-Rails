# frozen_string_literal: true

require 'test_helper'

class AddressKecamatanListTest < ActiveSupport::TestCase
  def setup
    @address_kecamatan =
      AddressKecamatanList.new(kecamatan: 'toba',
                               address_kabupaten_list_id: address_kabupaten_lists(:acehtengah).id)
  end
  test 'should be valid kecamatan' do
    assert @address_kecamatan.valid?
  end
  test 'kecamatan should be present' do
    @address_kecamatan.kecamatan = ' '
    assert_not @address_kecamatan.valid?
  end
  test 'kecamatan should be unique' do
    duplicate_kecamatan = @address_kecamatan.dup
    @address_kecamatan.save
    assert_not duplicate_kecamatan.valid?
  end
  test 'should reject for too long kecamatan' do
    @address_kecamatan.kecamatan = 'a' * 36
    assert_not @address_kecamatan.valid?
  end
  test 'should reject for too short kecamatan' do
    @address_kecamatan.kecamatan = 'a' * 2
    assert_not @address_kecamatan.valid?
  end
  test 'should reject for null province id' do
    @address_kecamatan.address_kabupaten_list_id = nil
    assert_not @address_kecamatan.valid?
  end
end
