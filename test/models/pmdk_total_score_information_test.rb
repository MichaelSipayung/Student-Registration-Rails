# frozen_string_literal: true

require 'test_helper'

class PmdkTotalScoreInformationTest < ActiveSupport::TestCase
  def setup
    @pmdk_total =
      PmdkTotalScoreInformation.new(user_id: users(:michael).id, jumlah_nilai_semester1: 120.5,
                                    jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
                                    jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
                                    jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
                                    jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
                                    jumlah_pelajaran_semester5: 14)
  end
  test 'should be a valid pmdk total score information' do
    assert @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_nilai_semester 1' do
    @pmdk_total.jumlah_nilai_semester1 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester1 = 0.5
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester1 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_nilai_semester 2' do
    @pmdk_total.jumlah_nilai_semester2 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester2 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester2 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_nilai_semester 3' do
    @pmdk_total.jumlah_nilai_semester3 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester3 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester3 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_nilai_semester 4' do
    @pmdk_total.jumlah_nilai_semester4 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester4 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester4 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_nilai_semester 5' do
    @pmdk_total.jumlah_nilai_semester5 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester5 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_nilai_semester5 = 'abs'
    assert_not @pmdk_total.valid?
  end

  test 'should reject invalid jumlah_matapelajaran_sem 1' do
    @pmdk_total.jumlah_pelajaran_semester1 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester1 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester1 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_matapelajaran_sem 2' do
    @pmdk_total.jumlah_pelajaran_semester2 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester2 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester2 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_matapelajaran_sem 3' do
    @pmdk_total.jumlah_pelajaran_semester3 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester3 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester3 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_matapelajaran_sem 4' do
    @pmdk_total.jumlah_pelajaran_semester4 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester4 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester4 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject invalid jumlah_matapelajaran_sem 5' do
    @pmdk_total.jumlah_pelajaran_semester5 = -10
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester5 = 0
    assert_not @pmdk_total.valid?
    @pmdk_total.jumlah_pelajaran_semester5 = 'abs'
    assert_not @pmdk_total.valid?
  end
  test 'should reject nil value for each pmdk jumlah pelajaran' do
    @pmdk_total.jumlah_pelajaran_semester1 =
      @pmdk_total.jumlah_pelajaran_semester2 = @pmdk_total.jumlah_pelajaran_semester3 =
        @pmdk_total.jumlah_pelajaran_semester4 = @pmdk_total.jumlah_pelajaran_semester5 = nil
    assert_not @pmdk_total.valid?
  end
  test 'should reject nil value for each pmdk jumlah nilai' do
    @pmdk_total.jumlah_nilai_semester1 =
      @pmdk_total.jumlah_nilai_semester2 = @pmdk_total.jumlah_nilai_semester3 =
        @pmdk_total.jumlah_nilai_semester4 = @pmdk_total.jumlah_nilai_semester5 = nil
    assert_not @pmdk_total.valid?
  end
end
