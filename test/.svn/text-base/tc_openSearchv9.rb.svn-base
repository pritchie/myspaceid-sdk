require 'test/unit'
require 'myspace'

class TC_openSearchv9 < Test::Unit::TestCase
  include MySpaceTest

  def test_imageSearchv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_nothing_raised do
        obj = ms.search_images('kati')
      end
      resultCount = obj['resultCount']
      assert_not_equal(0, resultCount)
      searchList = obj['entry']
      assert_instance_of (Array,searchList)
      item= searchList[0]
      assert_equal(7,item.length)
      searchId = obj['searchId']
      assert_instance_of(String,searchId)
      end
  end
  
  def test_peopleSearchv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_nothing_raised do
        obj = ms.search_people('kati')
      end
      resultCount = obj['resultCount']
      assert_not_equal(0, resultCount)
      searchList = obj['entry']
      assert_instance_of (Array,searchList)
      item= searchList[0]
      assert_equal(10,item.length)
      searchId = obj['searchId']
      assert_instance_of(String,searchId)
      end
  end
  
  def test_videoSearchv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_nothing_raised do
        obj = ms.search_videos('kati')
      end
      resultCount = obj['resultCount']
      assert_not_equal(0, resultCount)
      searchList = obj['entry']
      assert_instance_of (Array,searchList)
      item= searchList[0]
      assert_equal(17,item.length)
      searchId = obj['searchId']
      assert_instance_of(String,searchId)
      end
  end
end
