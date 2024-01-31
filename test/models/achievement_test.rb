# frozen_string_literal: true

require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @achievement = Achievement.new(user_id: @user.id, nama_prestasi: 'example',
                                   tingkat: 'kota', tahun: '2017-12-12', kategori: 'akademik')
  end
  test 'should be valid' do
    assert @achievement.valid?
  end
  test 'nama_prestasi should not be to short' do
    @achievement.nama_prestasi = 'a' * 3
    assert_not @achievement.valid?
  end
  test 'nama_prestasi should not be to long' do
    @achievement.nama_prestasi = 'a' * 31
    assert_not @achievement.valid?
  end
  test 'tingkat should not be to short' do
    @achievement.tingkat = 'a' * 3
    assert_not @achievement.valid?
  end
  test 'tingkat should not be to long' do
    @achievement.tingkat = 'a' * 21
    assert_not @achievement.valid?
  end
  test 'tahun should not be to short' do
    @achievement.tahun = 'a' * 3
    assert_not @achievement.valid?
  end
  test 'tahun should not be to long' do
    @achievement.tahun = 'a' * 21
    assert_not @achievement.valid?
  end
  test 'kategori should not be to short' do
    @achievement.kategori = 'a' * 3
    assert_not @achievement.valid?
  end
  test 'kategori should not be to long' do
    @achievement.kategori = 'a' * 21
    assert_not @achievement.valid?
  end
end
