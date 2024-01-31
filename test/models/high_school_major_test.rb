# frozen_string_literal: true

require 'test_helper'

class HighSchoolMajorTest < ActiveSupport::TestCase
  def setup
    @high_major = HighSchoolMajor.new(jurusan: 'smk teknik')
  end
  test 'should accept right high school major' do
    assert @high_major.valid?
  end
  test 'should reject for major less than 3' do
    @high_major.jurusan = 's' * 2
    assert_not @high_major.valid?
  end
  test 'should reject for high school major greater than 25' do
    @high_major.jurusan = 's' * 26
    assert_not @high_major.valid?
  end
  test 'should reject non unique major' do
    @new_major = HighSchoolMajor.new(jurusan: high_school_majors(:one))
    assert_not @new_major.valid?
  end
  test 'should reject for empty high school major' do
    @high_major.jurusan = ''
    assert_not @high_major.valid?
  end
end
