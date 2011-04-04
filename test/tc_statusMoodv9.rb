require 'test/unit'
require 'myspace'

class TC_StatusMoodv9 < Test::Unit::TestCase
  include MySpaceTest

 
  def test_statusMoodCommentsv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_statusmood_comments(value,STATUS_ID)
        end
      end
      assert_nothing_raised do
        obj = ms.get_statusmood_comments(USER_ID,STATUS_ID)
      end
      assert_equal('0', obj['totalResults'])
      assert_equal(STATUS_ID, obj['statusId'])
      comments = obj['entry']
      assert_instance_of(Array, comments)
    end
  end
  

    def test_friendstatusMood
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_friends_statusmood(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_friends_statusmood(FRIEND_ID)
      end
      assert_instance_of(Hash, obj)
      assert_not_equal('0', obj['totalResults'])
      moodsArr = obj['entry']
      assert_instance_of(Array, moodsArr)
      mood = moodsArr[0]
      assert_instance_of(Hash, mood)
      assert_not_equal(0, mood.length)
    end
  end
  
  
    def test_selfstatusmoodhistory
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_self_statusmood_history(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_self_statusmood_history(USER_ID)
      end
      
      assert_instance_of(Hash, obj)
      assert_not_equal('0', obj['totalResults'])
      moodsArr = obj['entry']
      assert_instance_of(Array, moodsArr)
   mood = moodsArr[0]
      assert_instance_of(Hash, mood)
      assert_not_equal(0, mood.length)

    end
  end
  
  def test_friendsstatusmoodhistory
    obj = nil
    obj_all=nil
    obj_friends=nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_friends_statusmood_history(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_friends_statusmood_history(FRIEND_ID)
      end
      assert_instance_of(Hash, obj)
      assert_not_equal('0', obj['totalResults'])
      moodsArr = obj['entry']
      assert_instance_of(Array, moodsArr)
         mood = moodsArr[0]
      assert_instance_of(Hash, mood)
      assert_not_equal(0, mood.length)

    end
  end
  
  
  
  def test_updateMoodStatus
    [@ms_offsite].each do |ms|
         obj = ms.set_status(USER_ID,'','','excited','working on Ruby ;-)')
    end
      
  end
    
end
