require 'test/unit'
require 'myspace'

class TC_activitiesv9 < Test::Unit::TestCase
  include MySpaceTest

 
  def test_activitiesv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_activities(value)
        end
      end
      assert_nothing_raised do
          obj = ms.get_activities(USER_ID)
      end
      assert_not_equal(nil, obj)
    end
  end
end
