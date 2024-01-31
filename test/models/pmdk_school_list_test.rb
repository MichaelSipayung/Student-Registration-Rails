# frozen_string_literal: true

require 'test_helper'

class PmdkSchoolListTest < ActiveSupport::TestCase
  def setup
    @pmdk_school = PmdkSchoolList.new(sekolah: 'sma pelita')
  end
  test 'should accept the right school' do
    assert @pmdk_school.valid?
  end
  test 'should reject for empty school list' do
    @pmdk_school.sekolah = ''
    assert_not @pmdk_school.valid?
  end
  test 'should reject for too short school name' do
    @pmdk_school.sekolah = 'a' * 4
    assert_not @pmdk_school.valid?
  end
  test 'should reject for too long school name' do
    @pmdk_school.sekolah = 'a' * 36
    assert_not @pmdk_school.valid?
  end
  test 'should reject for non unique school name' do
    @pmdk_school.sekolah = pmdk_school_lists(:one).sekolah
    assert_not @pmdk_school.valid?
  end
end
