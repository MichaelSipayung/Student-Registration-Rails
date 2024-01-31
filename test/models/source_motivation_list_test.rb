# frozen_string_literal: true

require 'test_helper'

class SourceMotivationListTest < ActiveSupport::TestCase
  def setup
    @motivation = SourceMotivationList.new(motivasi: 'koran sindo')
  end
  test 'should accept the right source' do
    assert @motivation.valid?
  end
  test 'should reject for empty source' do
    @motivation.motivasi = ' '
    assert_not @motivation.valid?
  end
  test 'should reject for too short source' do
    @motivation.motivasi = 'a' * 3
    assert_not @motivation.valid?
  end
  test 'should reject for too long source' do
    @motivation.motivasi = 'a' * 21
    assert_not @motivation.valid?
  end
  test 'should reject for non unique source' do
    @motivation.motivasi = source_motivation_lists(:one)
    assert_not @motivation.valid?
  end
end
