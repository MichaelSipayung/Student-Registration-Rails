require "test_helper"

class PersonalTest < ActiveSupport::TestCase
  def setup
    @user  = users(:michael)
    @personal  = Personal.new(user_id: @user.id, nama_lengkap: "Example User", agama: 'islam', jenis_kelamin: 'laki-laki',
                              tempat_lahir: 'jakarta', tanggal_lahir: '1997-12-12',
                              nik: 1234567890123456, nisn: 1234567890, no_kps: 123456, domisili: 'jakarta')
  end
  test "should be valid" do
    assert @personal.valid?
  end
  test "nama_lengkap should be present" do
    @personal.nama_lengkap = ""
    assert_not @personal.valid?
  end
  test "nama_lengkap should not be too short" do
    @personal.nama_lengkap = "a"*3
    assert_not @personal.valid?
  end
  test "nama_lengkap should not be too long" do
    @personal.nama_lengkap = "a"*30
    assert_not @personal.valid?
  end
  test "agama should be present" do
    @personal.agama = ""
    assert_not @personal.valid?
  end
  test "agama should not be too short" do
    @personal.agama = "a"*3
    assert_not @personal.valid?
  end
  test "agama should not be too long" do
    @personal.agama = "a"*21
    assert_not @personal.valid?
  end
  test "jenis_kelamin should be present" do
    @personal.jenis_kelamin = ""
    assert_not @personal.valid?
  end
  test "jenis_kelamin should not be too short" do
    @personal.jenis_kelamin = "a"*3
    assert_not @personal.valid?
  end
  test "jenis_kelamin should not be too long" do
    @personal.jenis_kelamin = "a"*21
    assert_not @personal.valid?
  end
  test "tempat_lahir should be present" do
    @personal.tempat_lahir = ""
    assert_not @personal.valid?
  end
  test "tempat_lahir should not be too short" do
    @personal.tempat_lahir = "a"*3
    assert_not @personal.valid?
  end
  test "tempat_lahir should not be too long" do
    @personal.tempat_lahir = "a"*21
    assert_not @personal.valid?
  end
  test "tanggal_lahir should be present" do
    @personal.tanggal_lahir = ""
    assert_not @personal.valid?
  end
  test "tanggal_lahir should not be too short" do
    @personal.tanggal_lahir = "a"*3
    assert_not @personal.valid?
  end
  test "tanggal_lahir should not be too long" do
    @personal.tanggal_lahir = "a"*21
    assert_not @personal.valid?
  end
  test "nik should be present" do
    @personal.nik = ""
    assert_not @personal.valid?
  end
  test "nik should not be too short" do
    @personal.nik = "a"*15
    assert_not @personal.valid?
  end
  test "nik should not be too long" do
    @personal.nik = "a"*17
    assert_not @personal.valid?
  end
  test "nisn should be present" do
    @personal.nisn = ""
    assert_not @personal.valid?
  end
  test "nisn should not be too short" do
    @personal.nisn = "a"*10
    assert_not @personal.valid?
  end
  test "nisn should not be too long" do
    @personal.nisn = "a"*11
    assert_not @personal.valid?
  end
  test "no_kps should not be to short" do
    @personal.no_kps = "a"*5
    assert_not @personal.valid?
  end
  test "no_kps should not be to long" do
    @personal.no_kps = "a"*7
    assert_not @personal.valid?
  end
  test "domisili should be present" do
    @personal.domisili = ""
    assert_not @personal.valid?
  end
  test "domisili should not be too short" do
    @personal.domisili = "a"*3
    assert_not @personal.valid?
  end
  test "domisili should not be too long" do
    @personal.domisili = "a"*31
    assert_not @personal.valid?
  end
end
