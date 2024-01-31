# frozen_string_literal: true

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @address = Address.new(user_id: @user.id, alamat: 'example', kelurahan: 'example', kecamatan: 'example',
                           kode_pos: 12_345, provinsi: 'example', no_telepon: 1_234_567_890, kabupaten: 'example')
  end
  test 'should be valid' do
    assert @address.valid?
  end
  test 'alamat should not be blank' do
    @address.alamat = ''
    assert_not @address.valid?
  end
  test 'kelurahan should not be blank' do
    @address.kelurahan = ''
    assert_not @address.valid?
  end
  test 'kecamatan should not be blank' do
    @address.kecamatan = ''
    assert_not @address.valid?
  end
  test 'kode_pos should not be blank' do
    @address.kode_pos = ''
    assert_not @address.valid?
  end
  test 'provinsi should not be blank' do
    @address.provinsi = ''
    assert_not @address.valid?
  end
  test 'no_telepon should not be blank' do
    @address.no_telepon = ''
    assert_not @address.valid?
  end
  test 'kabupaten should not be blank' do
    @address.kabupaten = ''
    assert_not @address.valid?
  end

  test 'alamat should not be to short' do
    @address.alamat = 'a' * 3
    assert_not @address.valid?
  end
  test 'alamat should not be to long' do
    @address.alamat = 'a' * 31
    assert_not @address.valid?
  end
  test 'kelurahan should not be to short' do
    @address.kelurahan = 'a' * 3
    assert_not @address.valid?
  end
  test 'kelurahan should not be to long' do
    @address.kelurahan = 'a' * 31
    assert_not @address.valid?
  end
  test 'kecamatan should not be to short' do
    @address.kecamatan = 'a' * 3
    assert_not @address.valid?
  end
  test 'kecamatan should not be to long' do
    @address.kecamatan = 'a' * 31
    assert_not @address.valid?
  end
  test 'kode_pos should not be to short' do
    @address.kode_pos = 1234
    assert_not @address.valid?
  end
  test 'kode_pos should not be to long' do
    @address.kode_pos = 123_456
    assert_not @address.valid?
  end
  test 'provinsi should not be to short' do
    @address.provinsi = 'a' * 3
    assert_not @address.valid?
  end
  test 'provinsi should not be to long' do
    @address.provinsi = 'a' * 31
    assert_not @address.valid?
  end
  test 'no_telepon should not be to short' do
    @address.no_telepon = 123_456_789
    assert_not @address.valid?
  end
  test 'no_telepon should not be to long' do
    @address.no_telepon = 12_345_678_901_235
    assert_not @address.valid?
  end
  test 'kabupaten should not be to short' do
    @address.kabupaten = 'a' * 3
    assert_not @address.valid?
  end
  test 'kabupaten should not be to long' do
    @address.kabupaten = 'a' * 31
    assert_not @address.valid?
  end
end
