require "test_helper"

class ExtraTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @extra = Extra.new(user_id: @user.id,nama_kegiatan: 'example', mulai: '2022-12-12', berakhir: '2022-12-12', predikat:  'example')
  end
  test "should be valid" do
    assert @extra.valid?
  end
  test "nama_kegiatan should not be to short" do
    @extra.nama_kegiatan = "a"*3
    assert_not @extra.valid?
  end
  test "nama_kegiatan should not be to long" do
    @extra.nama_kegiatan = "a"*21
    assert_not @extra.valid?
  end
  test "predikat should not be to short" do
    @extra.predikat = "a"*3
    assert_not @extra.valid?
  end
  test "predikat should not be to long" do
    @extra.predikat = "a"*21
    assert_not @extra.valid?
  end
  test "mulai should not be to short" do
    @extra.mulai = "a"*3
    assert_not @extra.valid?
  end
  test "mulai should not be to long" do
    @extra.mulai = "a"*21
    assert_not @extra.valid?
  end
  test "berakhir should not be to short" do
    @extra.berakhir = "a"*3
    assert_not @extra.valid?
  end
  test "berakhir should not be to long" do
    @extra.berakhir = "a"*21
    assert_not @extra.valid?
  end

end
