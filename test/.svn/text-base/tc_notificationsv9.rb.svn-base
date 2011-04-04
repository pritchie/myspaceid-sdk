require 'test/unit'
require 'myspace'

class TC_notificationsv9 < Test::Unit::TestCase
  include MySpaceTest

  def test_notificationsv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_nothing_raised do
        obj = ms.send_notification('', USER_ID, '', '')
      end
      statusLink = obj['statusLink']
      assert_not_equal(0, statusLink.length)
     end
  end
end
