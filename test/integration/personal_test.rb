require "test_helper"

class PersonalTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
    get login_path
    post login_path, params: {session: {email: users(:michael), password: 'password'}}
    # @personal = personals(:one)
  end
  test "should create personal" do
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
  test "should not create personal" do
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
  test "should update personal" do
    get edit_personal_path(personals(:one))
    assert_response :success
  end
end
