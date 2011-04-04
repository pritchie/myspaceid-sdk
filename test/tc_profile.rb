require 'test/unit'

require 'myspace'

require 'myspace_test'

class TC_Profile < Test::Unit::TestCase
  include MySpaceTest

  def test_userid
    user_id = nil
    assert_nothing_raised do
      user_id = @ms_offsite.get_userid
    end
    assert_instance_of(String, user_id)
    assert_equal(USER_ID, user_id)
  end

  def test_profile
    [@ms_offsite].each do |ms|
    obj = nil
    BAD_IDS.each do |value|
      assert_raise(MySpace::BadIdentifier) do
        obj = ms.get_person(value,{:fields=>'@all'})
      end
    end
    assert_nothing_raised do
      obj = ms.get_person(USER_ID,params={:fields=>'@all'})
    end
    assert_instance_of(Hash, obj)
    assert_equal('1',obj['totalResults'])
    person = obj['person']
    assert_instance_of(Hash, person)
    name = person['name']
    assert_instance_of(Hash, name)
    givenName =name['givenName']
    assert_instance_of(String, givenName)
    familyName =name['familyName']
    assert_instance_of(String, familyName)
    profileUrl = person['profileUrl']
    assert_instance_of(String,profileUrl)
    urls=person['urls']
    assert_instance_of(Array, urls)
    end
  end

  def test_mood
    [@ms_offsite].each do |ms|
      obj = nil
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_statusmood(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_statusmood(PERSON_ID)
      end
      assert_instance_of(Hash, obj)
      mood = obj['moodName']
      assert_instance_of(String, mood)
      status =obj['status']
      assert_instance_of(String, status)
    end
  end
end
