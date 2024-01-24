require "test_helper"

class BatchListTest < ActiveSupport::TestCase
  def setup
    @batch  = BatchList.new(gelombang: 'pmdk sumut', aktif: true)
  end
  test "should accept valid gelombang" do
    assert @batch.valid?
  end
  test "should reject for empty gelombang" do
    @batch.gelombang = ' '
    assert_not @batch.valid?
  end
  test "should reject for to short gelombang" do
    @batch.gelombang ='a'*3
    assert_not @batch.valid?
  end
  test "should reject for to long gelombang" do
    @batch.gelombang = 'a'*26
    assert_not @batch.valid?
  end
  test "should reject non unique gelombang" do
    @batch.gelombang = batch_lists(:one).gelombang
    assert_not @batch.valid?
  end
  test "should accept only boolean value" do
    @batch.aktif = true
    assert @batch.valid?
  end
  test "should reject for non boolean value for gelombang status" do
    @batch.aktif = "done"
    assert_not_equal 'done', @batch.aktif
  end
end
