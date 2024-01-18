require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @organization = Organization.new(user_id: @user.id, nama_organisasi: 'example', mulai: '2022-12-12', berakhir: '2022-12-12', jabatan:  'example')
  end
  test "should be valid" do
    assert @organization.valid?
  end
  test "nama_organisasi should not be to short" do
    @organization.nama_organisasi = "a"*3
    assert_not @organization.valid?
  end
  test "nama_organisasi should not be to long" do
    @organization.nama_organisasi = "a"*21
    assert_not @organization.valid?
  end
  test "jabatan should not be to short" do
    @organization.jabatan = "a"*3
    assert_not @organization.valid?
  end
  test "jabatan should not be to long" do
    @organization.jabatan = "a"*21
    assert_not @organization.valid?
  end
  test "mulai should not be to short" do
    @organization.mulai = "a"*3
    assert_not @organization.valid?
  end
  test "mulai should not be to long" do
    @organization.mulai = "a"*21
    assert_not @organization.valid?
  end
  test "berakhir should not be to short" do
    @organization.berakhir = "a"*3
    assert_not @organization.valid?
  end
  test "berakhir should not be to long" do
    @organization.berakhir = "a"*21
    assert_not @organization.valid?
  end
end
