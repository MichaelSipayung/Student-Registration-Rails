# frozen_string_literal: true

require 'test_helper'

class UsmSchoolInformationTest < ActiveSupport::TestCase
  def setup
    @usm_school =
      UsmSchoolInformation.new(user_id: users(:michael).id, jurusan_sekolah: 'ipa',
                               asal_sekolah: 'sma santo tomas', akreditas: 'terakreditasi',
                               jumlah_pelajaran_semester5: 8, jumlah_nilai_semester5: 78.9)
  end
  test 'should be a valid utbk information' do
    assert @usm_school.valid?
  end
  test 'should reject for invalid asal sekolah - usm' do
    @usm_school.asal_sekolah = 'a' * 2
    assert_not @usm_school.valid?
    @usm_school.asal_sekolah = ' '
    assert_not @usm_school.valid?
    @usm_school.asal_sekolah = 'a' * 51
    assert_not @usm_school.valid?
  end
  test 'should reject for invalid jumlah nilai un-usm' do
    @usm_school.jumlah_nilai_un = 1000.5
    assert_not @usm_school.valid?
    @usm_school.jumlah_nilai_un = -12
    assert_not @usm_school.valid?
  end
  test 'should reject for invalid jumlah pelajaran un-usm' do
    @usm_school.jumlah_pelajaran_un = 50
    assert_not @usm_school.valid?
    @usm_school.jumlah_pelajaran_un = -1
    assert_not @usm_school.valid?
  end
  test 'should reject for invalid akreditas-usm' do
    @usm_school.akreditas = 'a' * 21
    assert_not @usm_school.valid?
    @usm_school.akreditas = ' '
    assert_not @usm_school.valid?
  end
  test 'should reject for invalid jumlah pelajaran semester 5-usm' do
    @usm_school.jumlah_pelajaran_semester5 = 21
    assert_not @usm_school.valid?
    @usm_school.jumlah_pelajaran_semester5 = -1
    assert_not @usm_school.valid?
  end
  test 'should reject for invalid jumlah nilai semester 5-usm' do
    @usm_school.jumlah_nilai_semester5 = -30.9
    assert_not @usm_school.valid?
    @usm_school.jumlah_nilai_semester5 = 2001
    assert_not @usm_school.valid?
  end
  test 'should allow non mandatory attribute to be empty-usm' do
    assert @usm_school.valid?
  end
end
