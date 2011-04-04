require 'test/unit'
require 'myspace'

class TC_profileCommentsv9 < Test::Unit::TestCase
  include MySpaceTest

  def test_profileCommentsv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_profilecommentsv9(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_profilecommentsv9(USER_ID)
      end
      assert_equal("0", obj['totalResults'])
      comments = obj['entry']
      assert_instance_of(Array, comments)
      assert_equal(0, comments.length)
     end
  end
end
