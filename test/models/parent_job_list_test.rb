require "test_helper"

class ParentJobListTest < ActiveSupport::TestCase
  def setup
    @job_list = ParentJobList.new(pekerjaan: 'tni')
  end
  test "should accept the job list" do
    assert @job_list.valid?
  end
  test "should reject for to short job" do
    @job_list.pekerjaan = 'pe'
    assert_not @job_list.valid?
  end
  test "should reject to long job" do
    @job_list.pekerjaan = 'p'*26
    assert_not @job_list.valid?
  end
  test "should reject non unique job" do
    @job_list.pekerjaan = parent_job_lists(:one)
    assert_not @job_list.valid?
  end
  test "should reject an empty job" do
    @job_list.pekerjaan = ''
    assert_not @job_list.valid?
  end
end
