# frozen_string_literal: true

require 'test_helper'

class AchievementTingkatListTest < ActiveSupport::TestCase
  def setup
    @tingkat_achivement = AchievementTingkatList.new(tingkat: 'kecamatan')
  end
  test 'should accept for right achievement-tingkat' do
    assert @tingkat_achivement.valid?
  end
  test 'should reject for empty achievement-tingkat' do
    @tingkat_achivement.tingkat = ' '
    assert_not @tingkat_achivement.valid?
  end
  test 'should reject for too short achievement-tigkat' do
    @tingkat_achivement.tingkat = 'a' * 3
    assert_not @tingkat_achivement.valid?
  end
  test 'should reject fot too long achievement-tingkat' do
    @tingkat_achivement.tingkat = 'a' * 16
    assert_not @tingkat_achivement.valid?
  end
  test 'should reject for non unique achievement-tingkat' do
    @tingkat_achivement.tingkat = achievement_tingkat_lists(:one).tingkat
    assert_not @tingkat_achivement.valid?
  end
end
