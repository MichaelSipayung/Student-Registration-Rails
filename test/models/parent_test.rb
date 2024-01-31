# frozen_string_literal: true

require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @parent = Parent.new(user_id: @user.id, nama_ayah: 'example', nama_ibu: 'example', pendidikan_ayah: 'sma',
                         pendidikan_ibu: 'sma', pekerjaan_ayah: 'wiraswasta', pekerjaan_ibu: 'wiraswasta',
                         tanggal_lahir_ayah: '1997-12-12', tanggal_lahir_ibu: '1997-12-12')
  end
  test 'should be valid' do
    assert @parent.valid?
  end
  test 'nama_ayah should be present' do
    @parent.nama_ayah = ''
    assert_not @parent.valid?
  end
  test 'nama_ayah should not be too short' do
    @parent.nama_ayah = 'a' * 3
    assert_not @parent.valid?
  end
  test 'nama_ayah should not be too long' do
    @parent.nama_ayah = 'a' * 26
    assert_not @parent.valid?
  end
  test 'nama_ibu should be present' do
    @parent.nama_ibu = ''
    assert_not @parent.valid?
  end
  test 'nama_ibu should not be too short' do
    @parent.nama_ibu = 'a' * 3
    assert_not @parent.valid?
  end
  test 'nama_ibu should not be too long' do
    @parent.nama_ibu = 'a' * 26
    assert_not @parent.valid?
  end
  test 'nik_ayah should not be present' do
    @parent.nik_ayah = ''
    assert @parent.valid?
  end
  test 'nik_ayah should not be too short' do
    @parent.nik_ayah = 'a' * 15
    assert_not @parent.valid?
  end
  test 'nik_ayah should not be too long' do
    @parent.nik_ayah = 'a' * 17
    assert_not @parent.valid?
  end
  test 'nik_ibu should not be present' do
    @parent.nik_ibu = ''
    assert @parent.valid?
  end
  test 'nik_ibu should not be too short' do
    @parent.nik_ibu = 'a' * 15
    assert_not @parent.valid?
  end
  test 'nik_ibu should not be too long' do
    @parent.nik_ibu = 'a' * 17
    assert_not @parent.valid?
  end
  test 'pendidikan_ayah should be present' do
    @parent.pendidikan_ayah = ''
    assert_not @parent.valid?
  end
  test 'pendidikan_ayah should not be too short' do
    @parent.pendidikan_ayah = 'a'
    assert_not @parent.valid?
  end
  test 'pendidikan_ayah should not be too long' do
    @parent.pendidikan_ayah = 'a' * 21
    assert_not @parent.valid?
  end
  test 'pendidikan_ibu should be present' do
    @parent.pendidikan_ibu = ''
    assert_not @parent.valid?
  end
  test 'pendidikan_ibu should not be too short' do
    @parent.pendidikan_ibu = 'a'
    assert_not @parent.valid?
  end
  test 'pendidikan_ibu should not be too long' do
    @parent.pendidikan_ibu = 'a' * 21
    assert_not @parent.valid?
  end
  test 'pekerjaan_ayah should be present' do
    @parent.pekerjaan_ayah = ''
    assert_not @parent.valid?
  end
  test 'pekerjaan_ayah should not be too short' do
    @parent.pekerjaan_ayah = 'a' * 2
    assert_not @parent.valid?
  end
  test 'pekerjaan_ayah should not be too long' do
    @parent.pekerjaan_ayah = 'a' * 21
    assert_not @parent.valid?
  end
  test 'pekerjaan_ibu should be present' do
    @parent.pekerjaan_ibu = ''
    assert_not @parent.valid?
  end
  test 'pekerjaan_ibu should not be too short' do
    @parent.pekerjaan_ibu = 'a' * 2
    assert_not @parent.valid?
  end
  test 'pekerjaan_ibu should not be too long' do
    @parent.pekerjaan_ibu = 'a' * 21
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ayah should be present' do
    @parent.tanggal_lahir_ayah = ''
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ayah should not be too short' do
    @parent.tanggal_lahir_ayah = 'a' * 3
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ayah should not be too long' do
    @parent.tanggal_lahir_ayah = 'a' * 21
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ibu should be present' do
    @parent.tanggal_lahir_ibu = ''
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ibu should not be too short' do
    @parent.tanggal_lahir_ibu = 'a' * 3
    assert_not @parent.valid?
  end
  test 'tanggal_lahir_ibu should not be too long' do
    @parent.tanggal_lahir_ibu = 'a' * 21
    assert_not @parent.valid?
  end
end
