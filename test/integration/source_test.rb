require "test_helper"

class SourceTestAll < ActionDispatch::IntegrationTest
  def setup
    @user = users(:iana)
  end
  test "should create new source of information" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_source_path
    assert_difference 'Source.count' do
      post sources_path, params: {source: {
        sumber_informasi: 'radio', jumlah_n: 3, motivasi: 'pendidikan'
      }}
    end
    assert_not_nil Source.find_by_sumber_informasi 'radio'
    assert_not_nil Source.find_by_jumlah_n 3
    assert_not_nil Source.find_by_motivasi 'pendidikan'
    #test has one source
    assert_no_difference 'Source.count' do
      post sources_path, params: {source: {
        sumber_informasi: 'radio baru', jumlah_n: 3, motivasi: 'pendidikan'
      }}
    end
    # assert_nil Source.find_by_sumber_informasi 'radio baru'
  end
  test "should not create any source if not logged in" do
    get new_source_path
    assert_no_difference 'Source.count' do
      post sources_path, params:  {source: {
        sumber_informasi: 'radio baru', jumlah_n: 3, motivasi: 'pendidikan'
      }}
    end
    assert_nil Source.find_by_sumber_informasi 'radio baru'
  end
  test "should not create for wrong source" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_source_path
    assert_no_difference 'Source.count' do
      post sources_path, params: {source:{
        sumber_informasi: '', jumlah_n: 3, motivasi: 'pendidikan'
      }}
    end
    assert_nil Source.find_by_sumber_informasi ''
    get new_source_path
    assert_no_difference 'Source.count' do
      post sources_path, params: { source: {
        sumber_informasi: 'Televisi', jumlah_n: '3a', motivasi: 'pendidikan'
      }}
    end
    assert_nil Source.find_by_jumlah_n '3a'
  end
  test "should not allow non permited params to create source" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get new_source_path
    assert_difference 'Source.count' do
      post sources_path, params: {source:{
        sumber_informasi: 'facebook', jumlah_n: 3, motivasi: 'pendidikan',
        user_id: 1231212109
      }}
    end
    assert_not_nil Source.find_by_sumber_informasi 'facebook'
    assert_nil Source.find_by_user_id 1231212109
  end
  test "should update the source" do
    @user = users(:michael)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get edit_source_path sources(:one)
    patch source_path(sources(:one)), params: {source: {
      sumber_informasi: 'facebook', jumlah_n: 3, motivasi: 'pendidikan'
    }}
    assert_equal 'facebook', sources(:one).reload.sumber_informasi
    assert_equal 3, sources(:one).reload.jumlah_n
    assert_equal 'pendidikan', sources(:one).reload.motivasi
  end
  test "should update but prevent the non permited params" do
    @user = users(:michael)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get edit_source_path sources(:one)
    patch source_path(sources(:one)), params: {source: {
      sumber_informasi: 'facebook', jumlah_n: 3, motivasi: 'pendidikan', user_id: 90890909
    }}
    assert_equal 'facebook', sources(:one).reload.sumber_informasi
    assert_equal 3, sources(:one).reload.jumlah_n
    assert_equal 'pendidikan', sources(:one).reload.motivasi
    assert_nil Source.find_by_user_id 90890909
  end
  test "should reject to update for invalid information" do
    @user = users(:michael)
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get edit_source_path sources(:one)
    patch source_path(sources(:one)), params: {source: {
      sumber_informasi: 'facebook', jumlah_n: 56, motivasi: 'pendidikan'
    }}
    sources(:one).reload
    assert_nil Source.find_by_sumber_informasi 'facebook'
    assert_nil Source.find_by_motivasi 'pendidikan'
    assert_nil Source.find_by_jumlah_n 20
  end

end
