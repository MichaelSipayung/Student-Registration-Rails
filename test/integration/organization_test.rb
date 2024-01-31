# frozen_string_literal: true

require 'test_helper'

class OrganizationTestAll < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
  end
  test 'should create organizations' do
    get new_organization_path
    assert_template 'organizations/new'
    assert_difference 'Organization.count' do
      post organizations_path, params: { organization: {
        nama_organisasi: 'osis sma', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'ketua pertama'
      } }
    end
    assert_not_nil Organization.find_by_nama_organisasi('osis sma')
    assert_not_nil Organization.find_by_jabatan('ketua pertama')
    # insert multiple times
    get new_organization_path
    assert_template 'organizations/new'
    assert_difference 'Organization.count' do
      post organizations_path, params: { organization: {
        nama_organisasi: 'pmk upi', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'sekretaris ahli'
      } }
    end
    assert_not_nil Organization.find_by_nama_organisasi('pmk upi')
    assert_not_nil Organization.find_by_jabatan('sekretaris ahli')
  end
  test 'should reject to create organization' do
    get new_organization_path
    assert_template 'organizations/new'
    assert_no_difference 'Organization.count' do
      post organizations_path, params: { organization: {
        nama_organisasi: 'osi', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'ketua pertama'
      } }
    end
    assert_nil Organization.find_by_nama_organisasi('osi')
    # empty information
    get new_organization_path
    assert_template 'organizations/new'
    assert_no_difference 'Organization.count' do
      post organizations_path, params: { organization: {
        nama_organisasi: '', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: ''
      } }
    end
    assert_nil Organization.find_by_nama_organisasi('')
  end
  test 'should reject non permited params while create organization' do
    get new_organization_path
    assert_template 'organizations/new'
    assert_difference 'Organization.count' do
      post organizations_path, params: { organization: {
        nama_organisasi: 'pmk ui', mulai: '2020-12-11',
        berakhir: '2011-10-11', jabatan: 'wakil', user_id: 200_989_770
      } }
    end
    assert_nil Organization.find_by_user_id(200_989_770)
  end
  test 'should update the organization' do
    get edit_organization_path(organizations(:one))
    assert_template 'organizations/edit'
    patch organization_path(organizations(:one)), params: { organization: {
      nama_organisasi: 'pmk ui jakarta', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wakil ketua pmk'
    } }
    assert_equal 'pmk ui jakarta', organizations(:one).reload.nama_organisasi
    assert_equal 'wakil ketua pmk', organizations(:one).reload.jabatan
    get edit_organization_path(organizations(:two))
    assert_template 'organizations/edit'
    patch organization_path(organizations(:two)), params: { organization: {
      nama_organisasi: 'pmk ui medan', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wakil ketua'
    } }
    assert_equal 'pmk ui medan', organizations(:two).reload.nama_organisasi
    assert_equal 'wakil ketua', organizations(:two).reload.jabatan
    assert_not_nil Organization.find_by_nama_organisasi('pmk ui medan')
    assert_not_nil Organization.find_by_nama_organisasi('pmk ui jakarta')
    assert_not_nil Organization.find_by_jabatan('wakil ketua pmk')
    assert_not_nil Organization.find_by_jabatan('wakil ketua')
  end
  test 'should reject to update organization' do
    get edit_organization_path(organizations(:one))
    assert_template 'organizations/edit'
    patch organization_path(organizations(:one)), params: { organization: {
      nama_organisasi: 'pmk', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wak'
    } }
    assert_not_equal 'pmk', organizations(:one).reload.nama_organisasi
    assert_not_equal 'wak', organizations(:one).reload.jabatan
    assert_nil Organization.find_by_nama_organisasi('pmk')
    assert_nil Organization.find_by_jabatan('wak')
  end
  test 'should not update non permited params' do
    get edit_organization_path(organizations(:one))
    assert_template 'organizations/edit'
    patch organization_path(organizations(:one)), params: { organization: {
      nama_organisasi: 'pmk ui', mulai: '2020-12-11',
      berakhir: '2011-10-11', jabatan: 'wakil', user_id: 98_908_700
    } }
    assert_nil Organization.find_by_user_id 98_908_700
  end
end
