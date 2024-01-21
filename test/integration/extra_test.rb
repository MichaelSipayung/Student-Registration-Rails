require "test_helper"

class ExtraTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    @extra = extras(:first_extra)
  end
  test "should create new extra activity" do
    get new_extra_path
    assert_template 'extras/new'
    assert_difference 'Extra.count' do
      post extras_path, params:
        {extra: {nama_kegiatan: 'extakurikuler 1',mulai: '2020-12-11',
                 berakhir: '2021-12-13',predikat: 'lulus'}}
    end
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 1'
    #create multiple time
    get new_extra_path
    assert_template 'extras/new'
    assert_difference 'Extra.count' do
      post extras_path, params:
        {extra: {nama_kegiatan: 'extakurikuler 2',mulai: '2020-12-11',
                 berakhir: '2021-12-13',predikat: 'tidak lulus'}}
    end
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 2'
    assert_not_nil Extra.find_by_nama_kegiatan 'extakurikuler 1'

  end
  test "should reject to create new extra activity" do
    get new_extra_path
    assert_template 'extras/new'
    # submit empty data
    assert_no_difference 'Extra.count' do
      post extras_path, params: {extra: {
        nama_kegiatan: '', mulai: '', berakhir: '', predikat: ''
      }}
    end
    #submit wrong information
    get new_extra_path
    assert_template 'extras/new'
    assert_no_difference 'Extra.count' do
      post extras_path, params: {extra: {
        nama_kegiatan: 'ext', mulai: '2021-12-09',
        berakhir: '2021-12-11', predikat: 'lulus'
      }}
    end
    assert_nil Extra.find_by_nama_kegiatan('ext')
    assert_nil Extra.find_by_nama_kegiatan('')
  end
  test "reject non permited params while create an activity" do
    get new_extra_path
    assert_template 'extras/new'
    assert_difference 'Extra.count' do
      post extras_path, params: {extra: {
        nama_kegiatan: 'extra', mulai: '2021-12-09',
        berakhir: '2021-12-11', predikat: 'lulus', user_id: 1209809
      }}
    end
    assert_nil Extra.find_by_user_id 1209809
  end
  test "should update the extra activity" do
    get edit_extra_path(extras(:first_extra))
    assert_template 'extras/edit'
    patch extra_path(extras(:first_extra)), params: {extra: {
      nama_kegiatan: 'osis', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lulus kegiatan'
    }}
    assert_equal 'osis', extras(:first_extra).reload.nama_kegiatan
    assert_equal 'lulus kegiatan', extras(:first_extra).reload.predikat
    #update multiple times
    get edit_extra_path(extras(:second_extra))
    assert_template 'extras/edit'
    patch extra_path(extras(:second_extra)), params: {extra: {
      nama_kegiatan: 'jitsu', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lulus'
    }}
    assert_equal 'jitsu', extras(:second_extra).reload.nama_kegiatan
    assert_equal 'lulus', extras(:second_extra).reload.predikat
    #compare first with the last updated
    assert_not_equal extras(:second_extra).reload.nama_kegiatan,
                     extras(:first_extra).reload.nama_kegiatan
  end
  test "should reject to update for wrong information" do
    get edit_extra_path(extras(:first_extra))
    assert_template 'extras/edit'
    patch extra_path(extras(:first_extra)), params: {extra: {
      nama_kegiatan: 'jiu', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lul'
    }}
    assert_nil Extra.find_by_nama_kegiatan 'jiu'
    assert_nil Extra.find_by_nama_kegiatan 'lul'
    #update multiple time
    get edit_extra_path(extras(:second_extra))
    assert_template 'extras/edit'
    patch extra_path(extras(:second_extra)), params: {extra: {
      nama_kegiatan: 'nia', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lul'
    }}
    assert_nil Extra.find_by_nama_kegiatan 'nia'
    assert_nil Extra.find_by_nama_kegiatan 'jiu'
  end
  test "should reject update for non permited param" do
    get edit_extra_path(extras(:first_extra))
    assert_template 'extras/edit'
    patch extra_path(extras(:second_extra)), params: {extra: {
      nama_kegiatan: 'osis sekolah', mulai: '2022-12-09',
      berakhir: '2023-12-11', predikat: 'lulus', user_id: 12980989
    }}
    assert_not_nil Extra.find_by_nama_kegiatan('osis sekolah')
    assert_nil Extra.find_by_user_id 12980989
  end
end
