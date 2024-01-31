# frozen_string_literal: true

require 'test_helper'

class AchievementKategoriListTest < ActiveSupport::TestCase
  def setup
    @kategori_achivement = AchievementKategoriList.new(kategori: 'akademik')
  end
  test 'should accept for right achievement-kategori' do
    assert @kategori_achivement.valid?
  end
  test 'should reject for empty achievement-kategori' do
    @kategori_achivement.kategori = ' '
    assert_not @kategori_achivement.valid?
  end
  test 'should reject for too short achievement-kategori' do
    @kategori_achivement.kategori = 'a' * 3
    assert_not @kategori_achivement.valid?
  end
  test 'should reject fot too long achievement-kategori' do
    @kategori_achivement.kategori = 'a' * 16
    assert_not @kategori_achivement.valid?
  end
  test 'should reject for non unique achievement-kategori' do
    @kategori_achivement.kategori = achievement_kategori_lists(:one).kategori
    assert_not @kategori_achivement.valid?
  end
end
