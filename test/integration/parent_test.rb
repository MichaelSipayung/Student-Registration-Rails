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
    assert_no_difference 'Parent.count' do
      post parents_path, params: {parent: {nama_ayah: 'example', nama_ibu: 'example', nik_ayah: 123, nik_ibu: 1234,
                                           pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
                                           tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'}}
    end
    assert_nil Parent.find_by_nik_ayah(123)
    assert_nil Parent.find_by_nik_ibu(1234)

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
        nama_ayah: 'luhut', nama_ibu: 'dinar', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
        pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
        tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'
      }}
    end
    assert_not_nil  Parent.find_by_nama_ayah('luhut')
    assert_not_nil  Parent.find_by_nama_ibu('dinar')
    assert_not_nil Parent.find_by_nik_ayah 1234567890121345
    assert_not_nil Parent.find_by_nik_ibu 1234567890123415
    #try create another parent information? has one relation
    assert_no_difference 'Parent.count' do
      post parents_path, params: {parent: {
        nama_ayah: 'luhut panjaitan', nama_ibu: 'dinar silaban', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
        pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
        tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru'
      }}
    end
    assert_nil Parent.find_by_nama_ayah('luhut panjaitan')
  end
  test "should update data for valid parent information" do
    get edit_parent_path(parents(:myparent))
    assert_template 'parents/edit'
    patch parent_path(parents(:myparent)), params: { parent: {
      nama_ayah: 'daniel', nama_ibu: 'nisa', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
      pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
    }}
    assert_equal 'daniel', parents(:myparent).reload.nama_ayah
    assert_equal 'nisa', parents(:myparent).reload.nama_ibu
    assert_equal 'Tentara', parents(:myparent).reload.pekerjaan_ayah
    assert_equal 'guru sd', parents(:myparent).reload.pekerjaan_ibu
    get edit_parent_path(parents(:myparent))
    assert_template 'parents/edit'
    patch parent_path(parents(:myparent)), params: { parent: {
      nama_ayah: 'daniel silaban', nama_ibu: 'nisa ritonga', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
      pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
    }}
    assert_not_nil Parent.find_by_nama_ayah('daniel silaban')
    assert_not_nil Parent.find_by_nama_ibu('nisa ritonga')
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
    assert_nil Parent.find_by_nama_ayah('daniel')
  end
  test "should not created based on non permited parent information" do
    @user = users(:archer)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_parent_path
    assert_template 'parents/new'
    assert_difference 'Parent.count' do
      post parents_path, params: {parent: {
        nama_ayah: 'luhut', nama_ibu: 'dinar', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
        pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
        tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru', user_id: 123
      }}
    end
    assert_nil Parent.find_by_user_id 123
  end
  test "should not update based on non permited parent information" do
    get edit_parent_path(parents(:myparent))
    patch parent_path(parents(:myparent)), params: {parent: {
      nama_ayah: 'luhut', nama_ibu: 'dinar', nik_ayah: 1234567890121345, nik_ibu: 1234567890123415,
      pendidikan_ayah: 'sma', pendidikan_ibu: 'slta', tanggal_lahir_ayah: '2020-12-11',
      tanggal_lahir_ibu: '2013-12-10', pekerjaan_ayah: 'buruh', pekerjaan_ibu: 'guru', user_id: 21314
    }}
    assert_nil Parent.find_by_user_id 21314
  end
end
