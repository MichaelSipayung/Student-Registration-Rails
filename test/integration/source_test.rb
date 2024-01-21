require "test_helper"

class SourceTest < ActionDispatch::IntegrationTest
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
    assert_nil Source.find_by_sumber_informasi 'radio baru'
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
end
