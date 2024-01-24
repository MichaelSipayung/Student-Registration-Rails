require "test_helper"

class SourceInformationListTest < ActiveSupport::TestCase
  def setup
    @source_info  = SourceInformationList.new(informasi: 'koran sindo')
  end
  test "should accept the right source" do
    assert @source_info.valid?
  end
  test "should reject for empty source" do
    @source_info.informasi=' '
    assert_not @source_info.valid?
  end
  test "should reject for too short source" do
    @source_info.informasi= 'a'*3
    assert_not @source_info.valid?
  end
  test "should reject for too long source" do
    @source_info.informasi ='a'*26
    assert_not @source_info.valid?
  end
  test "should reject for non unique source" do
    @source_info.informasi  = source_information_lists(:one)
    assert_not @source_info.valid?
  end
end
