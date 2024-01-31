# frozen_string_literal: true

require 'test_helper'

class MajorTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @major = Major.new(user_id: @user.id, jurusan_1: 'example', jurusan_2: 'example1', jurusan_3: 'example3',
                       gelombang: 'example')
  end
  test 'should be valid' do
    assert @major.valid?
  end
  test 'jurusan_1  is required' do
    @major.jurusan_1 = ''
    assert_not @major.valid?
  end
  test 'jurusan_2  is required' do
    @major.jurusan_2 = ''
    assert_not @major.valid?
  end
  test 'jurusan_3  is required' do
    @major.jurusan_3 = ''
    assert_not @major.valid?
  end
  test 'gelombang  is required' do
    @major.gelombang = ''
    assert_not @major.valid?
  end

  test "jurusan_1 can't be equal to jurusan_2" do
    @major.jurusan_1 = 'example'
    @major.jurusan_2 = 'example'
    assert_not @major.valid?
  end
  test "jurusan_1 can't be equal to jurusan_3" do
    @major.jurusan_1 = 'example'
    @major.jurusan_3 = 'example'
    assert_not @major.valid?
  end
  test "jurusan_2 can't be equal to jurusan_3" do
    @major.jurusan_2 = 'example'
    @major.jurusan_3 = 'example'
    assert_not @major.valid?
  end

  test 'jurusan_1 should not be to short' do
    @major.jurusan_1 = 'a' * 3
    assert_not @major.valid?
  end
  test 'jurusan_1 should not be to long' do
    @major.jurusan_1 = 'a' * 31
    assert_not @major.valid?
  end
  test 'jurusan_2 should not be to short' do
    @major.jurusan_2 = 'a' * 3
    assert_not @major.valid?
  end
  test 'jurusan_2 should not be to long' do
    @major.jurusan_2 = 'a' * 31
    assert_not @major.valid?
  end
  test 'jurusan_3 should not be to short' do
    @major.jurusan_3 = 'a' * 3
    assert_not @major.valid?
  end
  test 'jurusan_3 should not be to long' do
    @major.jurusan_3 = 'a' * 31
    assert_not @major.valid?
  end
  test 'gelombang should not be to short' do
    @major.gelombang = 'a' * 3
    assert_not @major.valid?
  end
  test 'gelombang should not be to long' do
    @major.gelombang = 'a' * 31
    assert_not @major.valid?
  end
end
