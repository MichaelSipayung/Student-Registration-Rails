require "test_helper"

class PersonalTest < ActionDispatch::IntegrationTest
  def setup
    # @personal = personals(:one)
    get login_path
    post login_path, params: { session: { email:    users(:michael).email, password: 'password' } }
  end
  test "should create personal for valid information" do
    @user = users(:archer)

    get login_path
    post login_path, params: { session: { email:    @user.email, password: 'password' } }
    get new_personal_path
    assert_response :success
    assert_difference 'Personal.count', 1 do
      post personals_path, params: {personal: {nama_lengkap: "Michael Sipayung", agama: "Kristen", nik: "1234567890123456",
                                                nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                                                tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    end
  end
  test "should not create personal for invalid data" do
    @user = users(:archer)
    get login_path
    post login_path, params: { session: { email:    @user.email, password: 'password' } }
    get new_personal_path
    assert_response :success
    assert_no_difference 'Personal.count' do
      post personals_path, params: {personal: {nama_lengkap: "", agama: "Kristen", nik: "1234567890123456",
                                               nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                                               tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    end
  end
  test "success update or edit data" do
    get edit_personal_path(personals(:one))
    assert_template 'personals/edit'
    assert_response :success
    patch personal_path(personals(:one)), params: {personal: {nama_lengkap: "Michael januari", agama: "Muslim", nik: "1234567890123456",
                                                                nisn: "1234567890", no_kps: "123456", tanggal_lahir: "1999-12-12",
                                                                tempat_lahir: "Medan", jenis_kelamin: "Laki-laki", domisili: "Medan"}}
    assert_equal "Michael januari", personals(:one).reload.nama_lengkap
    assert_equal "Muslim", personals(:one).reload.agama
  end
  test "should not update or edit data for invalid data" do
    get edit_personal_path(personals(:one))
    assert_template 'personals/edit'
    patch personal_path(personals(:one)), params: {personal: {nama_lengkap: 'di'}}
    assert_template 'personals/edit'
  end
end
