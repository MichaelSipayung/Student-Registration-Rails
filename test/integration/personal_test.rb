require "test_helper"

class PersonalTest < ActionDispatch::IntegrationTest
  def setup
    # @personal = personals(:one)
    get login_path
    post login_path, params: { session: { email:    users(:michael).email, password: 'password' } }
  end
  test "should create personal for valid information" do
    @user = users(:iana)
    get login_path
    post login_path, params: { session: { email:    @user.email, password: 'password' } }
    get new_personal_path
    assert_response :success
    assert_difference 'Personal.count', 1 do
      post personals_path, params: {personal:
                                      {nama_lengkap: "Michael Sipayung", agama: "Kristen", nik: 1234567890123456,
                                       nisn: 1234567890, no_kps: 123456, tanggal_lahir: "1999-12-12",
                                       tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    end
    assert_not_nil Personal.find_by_nama_lengkap('Michael Sipayung')
    assert_not_nil  Personal.find_by_domisili('Medan')
    assert_not_nil  Personal.find_by_nisn 1234567890
    assert_not_nil   Personal.find_by_nik 1234567890123456
    assert_not_nil Personal.find_by_no_kps 123456
    assert_no_difference 'Personal.count', 1 do
      post personals_path, params: {personal:
                                      {nama_lengkap: "Michael jane", agama: "Kristen", nik: 1234567890123456,
                                       nisn: 1234567890, no_kps: 123456, tanggal_lahir: "1999-12-12",
                                       tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    end
    assert_nil Personal.find_by_nama_lengkap('Michael jane')
  end
  test "should not create personal for invalid data" do
    @user = users(:iana)
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    get new_personal_path
    assert_response :success
    assert_no_difference 'Personal.count' do
      post personals_path, params: {personal:
                                      {nama_lengkap: "", agama: "Kristen", nik: "1234567890123456",
                                       nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                                       tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    end
    assert_nil Personal.find_by_nama_lengkap('')
  end
  test "success update or edit data" do
    get edit_personal_path(personals(:one))
    assert_template 'personals/edit'
    assert_response :success
    patch personal_path(personals(:one)), params:
      {personal: {nama_lengkap: "Michael januari", agama: "Muslim", nik: "1234567890123456",
                  nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                  tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    assert_equal "Michael januari", personals(:one).reload.nama_lengkap
    assert_equal "Muslim", personals(:one).reload.agama
    assert_not_equal personals(:one).nama_lengkap, personals(:two).nama_lengkap
  end
  test "should not update or edit data for invalid data" do
    get edit_personal_path(personals(:one))
    assert_template 'personals/edit'
    patch personal_path(personals(:one)), params: {personal: {nama_lengkap: 'di'}}
    assert_nil Personal.find_by_nama_lengkap('di')
    assert_template 'personals/edit'
  end
  test "should reject invalid params while create personal data" do
    @user = users(:iana)
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    get new_personal_path
    assert_response :success
    assert_difference 'Personal.count' do
      post personals_path, params: {personal:
                                      {nama_lengkap: "donald", agama: "Kristen", nik: "1234567890123456",
                                       nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                                       tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan",
                                       user_id: 1908909}}
    end
    assert_not_nil Personal.find_by_nama_lengkap('donald')
    assert_nil Personal.find_by_user_id 1908909
  end
  test "should not update for non permited data" do
    get edit_personal_path(personals(:one))
    assert_template 'personals/edit'
    assert_response :success
    patch personal_path(personals(:one)), params:
      {personal: {nama_lengkap: "Michael januari", agama: "Muslim", nik: "1234567890123456",
                  nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                  tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan", user_id: 190789}}
    assert_nil Personal.find_by_user_id 190789
    assert_not_nil Personal.find_by_nama_lengkap 'Michael januari'
  end
end
