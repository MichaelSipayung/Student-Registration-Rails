require "test_helper"

class UtbkSchoolInformationTest < ActiveSupport::TestCase
  def setup
    @utbk_information = UtbkSchoolInformation.new(
      user_id: users(:michael).id, asal_sekolah: 'sma tarutung',
      jumlah_pelajaran_un: 5, jumlah_nilai_un: 50.5, akreditas: 'A'
    )
  end
  test "should be a valid utbk information" do
    assert @utbk_information.valid?
  end
  test "should reject for invalid asal sekolah - utbk" do
    @utbk_information.asal_sekolah='a'*2
    assert_not @utbk_information.valid?
    @utbk_information.asal_sekolah=' '
    assert_not @utbk_information.valid?
    @utbk_information.asal_sekolah='a'*51
    assert_not @utbk_information.valid?
  end
  test "should reject for invalid jumlah nilai un-utbk" do
    @utbk_information.jumlah_nilai_un= 1000.5
    assert_not @utbk_information.valid?
    @utbk_information.jumlah_nilai_un=  -12
    assert_not @utbk_information.valid?
  end
  test "should reject for invalid jumlah pelajaran un-utbk" do
    @utbk_information.jumlah_pelajaran_un = 50
    assert_not @utbk_information.valid?
    @utbk_information.jumlah_pelajaran_un = -1
    assert_not @utbk_information.valid?
  end
  test "should reject for invalid akreditas-utbk" do
    @utbk_information.akreditas = 'a'*21
    assert_not @utbk_information.valid?
    @utbk_information.akreditas =  ' '
    assert_not @utbk_information.valid?
  end
end
