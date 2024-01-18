require "test_helper"

class ParentTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
  end
  test "should not create new parent data for invalid data" do
    @user = users(:archer)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_parent_path
    assert_template 'parents/new'
    assert_no_difference 'Parent.count', -1 do
      post parents_path, params: {parent: {nama_ayah: 'example', nama_ibu: 'example', nik_ayah: '123', nik_ibu: '1234',
                                           pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
                                           tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'}}
    end
    assert_template  'parents/new'
  end
  test "should create new parent data for valid valid information" do
    @user = users(:archer)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_parent_path
    assert_template 'parents/new'
    assert_difference 'Parent.count' do
      post parents_path, params: {parent: {
        nama_ayah: 'example', nama_ibu: 'example', nik_ayah: '1234567890121345', nik_ibu: '1234567890123415',
        pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
        tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'
      }}
    end
    assert_response :success
  end
  test "should update data for valid information" do
    get edit_parent_path(parents(:myparent))
    assert_template 'parents/edit'
    patch parent_path(parents(:myparent)), params: { parent: {
      nama_ayah: 'daniel', nama_ibu: 'nisa', nik_ayah: '1234567890121345', nik_ibu: '1234567890123415',
      pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
    }}
    assert_equal 'daniel', parents(:myparent).reload.nama_ayah
    assert_equal 'nisa', parents(:myparent).reload.nama_ibu
    assert_equal 'Tentara', parents(:myparent).reload.pekerjaan_ayah
    assert_equal 'guru sd', parents(:myparent).reload.pekerjaan_ibu
  end
  test "should not update data for invalid information" do
    get edit_parent_path(parents(:myparent))
    assert_template 'parents/edit'
    patch parent_path(parents(:myparent)), params: { parent: {
      nama_ayah: 'daniel', nama_ibu: 'nisa bana', nik_ayah: '1234567890121345', nik_ibu: '1234567890123415',
      pendidikan_ayah: '', pendidikan_ibu: '', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
    }}
    assert_template 'parents/edit'
    assert_equal 'sma', parents(:myparent).reload.pendidikan_ayah
    assert_equal 'slta', parents(:myparent).reload.pendidikan_ibu
    assert_equal 'nisa', parents(:myparent).reload.nama_ibu
  end
end
