# frozen_string_literal: true

require 'test_helper'

class PmdkEachScoreInformationTest < ActiveSupport::TestCase
  def setup
    @pmdk_each_score =
      PmdkEachScoreInformation.new(user_id: users(:michael).id,
                                   matematika_semester_1: 90, matematika_semester_2: 80,
                                   matematika_semester_3: 89, matematika_semester_4: 90.8,
                                   matematika_semester_5: 88.9, kimia_semester_1: 98.9,
                                   kimia_semester_2: 98.9, kimia_semester_3: 88.7,
                                   kimia_semester_4: 88.5, kimia_semester_5: 88.1,
                                   fisika_semester_1: 34.9, fisika_semester_2: 99.9,
                                   fisika_semester_3: 88.9, fisika_semester_4: 99.7,
                                   fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
                                   bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
                                   bahasa_inggris_semester_4: 88.1, bahasa_inggris_semester_5: 99)
  end
  test 'should be valid pmdk each score information' do
    assert @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_1 score' do
    @pmdk_each_score.matematika_semester_1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_2 score' do
    @pmdk_each_score.matematika_semester_2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_3 score' do
    @pmdk_each_score.matematika_semester_3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_4 score' do
    @pmdk_each_score.matematika_semester_4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid matematika_semester_5 score' do
    @pmdk_each_score.matematika_semester_5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.matematika_semester_5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_1 score' do
    @pmdk_each_score.fisika_semester_1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_2 score' do
    @pmdk_each_score.fisika_semester_2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_3 score' do
    @pmdk_each_score.fisika_semester_3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_4 score' do
    @pmdk_each_score.fisika_semester_4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid fisika_semester_5 score' do
    @pmdk_each_score.fisika_semester_5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.fisika_semester_5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_1 score' do
    @pmdk_each_score.kimia_semester_1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_2 score' do
    @pmdk_each_score.kimia_semester_2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_3 score' do
    @pmdk_each_score.kimia_semester_3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_4 score' do
    @pmdk_each_score.kimia_semester_4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid kimia_semester_5 score' do
    @pmdk_each_score.kimia_semester_5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.kimia_semester_5 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_1 score' do
    @pmdk_each_score.bahasa_inggris_semester_1 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_1 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_1 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_2 score' do
    @pmdk_each_score.bahasa_inggris_semester_2 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_2 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_2 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_3 score' do
    @pmdk_each_score.bahasa_inggris_semester_3 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_3 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_3 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_4 score' do
    @pmdk_each_score.bahasa_inggris_semester_4 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_4 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_4 = nil
    assert_not @pmdk_each_score.valid?
  end
  test 'should reject invalid bahasa_inggris_sem_5 score' do
    @pmdk_each_score.bahasa_inggris_semester_5 = 1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_5 = -1
    assert_not @pmdk_each_score.valid?
    @pmdk_each_score.bahasa_inggris_semester_5 = nil
    assert_not @pmdk_each_score.valid?
  end
end
