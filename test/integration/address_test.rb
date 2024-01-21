require "test_helper"

class AddressTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test "should create new address for valid data" do
    get new_address_path
    assert_template 'addresses/new'
    assert_difference 'Address.count' do
      post addresses_path, params: {address: {
        alamat: 'jambi', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 12345, provinsi: 'example', no_telepon: 1234567890, kabupaten: 'example'
      }}
    end
    get new_address_path
    assert_template 'addresses/new'
    # multiple address inserted
    assert_difference 'Address.count' do
      post addresses_path, params: {address: {
        alamat: 'malasyia', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 12345, provinsi: 'example', no_telepon: 1234567890, kabupaten: 'example'
      }}
    end
    assert_not_nil Address.find_by_alamat('jambi')
    assert_not_nil Address.find_by_alamat('malasyia')
  end
  test "should reject invalid information" do
    get new_address_path
    assert_template 'addresses/new'
    assert_no_difference 'Address.count' do
      post addresses_path, params: {address: {
        alamat: 'malasyia', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 1234, provinsi: 'example', no_telepon: 1234567890, kabupaten: 'example'
      }}
    end
    get new_address_path
    assert_template 'addresses/new'
    assert_no_difference 'Address.count' do #unpermited user_id parameter
      post addresses_path, params: {address: {
        alamat: 'malasyia', kelurahan: 'example', kecamatan: 'example',
        kode_pos: 1234, provinsi: 'example', no_telepon: 1234567890, kabupaten: 'example', user_id: 3
      }}
    end
    assert_nil Address.find_by_kode_pos 1234
  end
  test "should update the address" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_address_path(addresses(:addresscurr))
    patch address_path(addresses(:addresscurr)), params: {address: {
      alamat: 'malasyia', kelurahan: 'kuala lumpur', kecamatan: 'desa lau',
      kode_pos: 12346, provinsi: 'malasyia', no_telepon: 1234567899, kabupaten: 'dolok sihol'
    }}
    assert_equal 'malasyia', addresses(:addresscurr).reload.alamat
    assert_equal 'kuala lumpur', addresses(:addresscurr).reload.kelurahan
    assert_equal 'desa lau', addresses(:addresscurr).reload.kecamatan
    assert_equal 'malasyia', addresses(:addresscurr).reload.provinsi
    assert_equal 'dolok sihol', addresses(:addresscurr).reload.kabupaten
    assert_equal 12346, addresses(:addresscurr).reload.kode_pos
    assert_equal 1234567899, addresses(:addresscurr).reload.no_telepon
    #compare two other object
    assert_not_equal addresses(:two).alamat, addresses(:addresscurr).reload.alamat
  end
  test "should reject to update address for invalid information" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_address_path(addresses(:addresscurr))
    assert_template 'addresses/edit'
    patch address_path(addresses(:addresscurr)), params: {address: {
      alamat: 'mal', kelurahan: 'kua', kecamatan: 'des',
      kode_pos: 1234, provinsi: 'may', no_telepon: 1234567, kabupaten: 'dol'
    }}
    assert_not_equal 'mal', addresses(:addresscurr).reload.alamat
    assert_not_equal 'kua', addresses(:addresscurr).reload.kelurahan
    assert_not_equal 'des', addresses(:addresscurr).reload.kecamatan
    assert_not_equal 'may', addresses(:addresscurr).reload.provinsi
    assert_not_equal 'dol', addresses(:addresscurr).reload.kabupaten
    assert_not_equal '1234', addresses(:addresscurr).reload.kode_pos
    assert_not_equal '1234567', addresses(:addresscurr).reload.no_telepon
  end
  test "should reject update attribute for unpermited params" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_address_path(addresses(:addresscurr))
    assert_template 'addresses/edit'
    patch address_path, params: {address: {
      alamat: 'malasyia', kelurahan: 'kuala lumpur', kecamatan: 'desa lau',
      kode_pos: 12346, provinsi: 'malasyia', no_telepon: 1234567899, kabupaten: 'dolok sihol', user_id: 12
    }}
    assert_not_equal 12, addresses(:addresscurr).reload.user_id
  end
end
