require 'test/unit'
require 'myspace'

class TC_groupsv9 < Test::Unit::TestCase
  include MySpaceTest

  def test_groups
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_groups(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_groups(USER_ID)
      end
      assert_equal('0', obj['totalResults'])
      groupsList = obj['entry']
      assert_instance_of(Array, groupsList)
    end
  end
end
