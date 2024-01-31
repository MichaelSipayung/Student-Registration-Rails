# frozen_string_literal: true

require 'test_helper'

class OrganizationDegreeListTest < ActiveSupport::TestCase
  def setup
    @organization_ls = OrganizationDegreeList.new(jabatan: 'Ketua')
  end
  test 'should accept for valid organization degree list' do
    assert @organization_ls.valid?
  end
  test 'should reject for empty organization degree list' do
    @organization_ls.jabatan = ' '
    assert_not @organization_ls.valid?
  end
  test 'organization degree list should not too short' do
    @organization_ls.jabatan = 'a' * 2
    assert_not @organization_ls.valid?
  end
  test 'organization degree list should not too long' do
    @organization_ls.jabatan = 'a' * 16
    assert_not @organization_ls.valid?
  end
  test 'ogranization degree list should unique' do
    @organization_ls.jabatan = organization_degree_lists(:one).jabatan
    assert_not @organization_ls.valid?
  end
end
