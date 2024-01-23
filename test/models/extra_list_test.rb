require "test_helper"

class ExtraListTest < ActiveSupport::TestCase
  def setup
    @extra = ExtraList.new(predikat: 'lulus')
  end
  test "should accept right predikat in extra list" do
    assert @extra.valid?
  end
  test "should reject for too short predikat" do
    @extra.predikat = 'a'*3
    assert_not @extra.valid?
  end
  test "should reject for too long predikat" do
    @extra.predikat = 'a'*16
    assert_not @extra.valid?
  end
  test "should reject for empty predikat" do
    @extra.predikat = " "
    assert_not @extra.valid?
  end
  test "should reject for non unique predikat" do
    @extra.predikat = extra_lists(:one)
    assert_not @extra.valid?
  end
end
