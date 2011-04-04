require 'test/unit'
require 'myspace'

class TC_Peoplev9 < Test::Unit::TestCase
  include MySpaceTest

  def test_people
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_person(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_person(USER_ID)
      end
      assert_not_equal('0', obj['totalResults'])
      person = obj['person']
      assert_instance_of(Hash, person)
      assert_equal(7, person.length)
      displayName = person['displayName']
      assert_instance_of(String, displayName)
    end
  end

 def test_people_friends
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_friends(value)
        end
      end
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_friends(value)
        end
      end

      assert_nothing_raised do
        obj = ms.get_friends(USER_ID)
      end
      
      assert_not_equal('0','totalResults')
      friendsArr = obj['entry']
      assert_instance_of(Array,friendsArr)
      friend =friendsArr[0]['person']
      assert_instance_of(Hash,friend )
    end
  end
end
