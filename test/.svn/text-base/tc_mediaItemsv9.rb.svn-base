require 'test/unit'
require 'myspace'

class TC_MediaItemsV9 < Test::Unit::TestCase
  include MySpaceTest

  def test_mediaItems_albumv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_nothing_raised do
        obj = ms.get_mediaitems(PERSON_ID,ALBUM_ID)
      end
      assert_not_equal('0', obj['totalResults'])
      items = obj['entry'][0]
      assert_instance_of(Hash, items)
      assert_not_equal(0, items.length)
      mediaItem = items['mediaItem']
      assert_instance_of(Hash, mediaItem)
      photo_id = mediaItem['id'].to_s
      assert_equal('myspace.com.mediaItem.image.'+PHOTO_ID, photo_id)
      title = mediaItem['title']
      assert_instance_of(String, title)
      assert_equal('IMAGE', mediaItem['type'])
    end
  end
  
   def test_mediaItem_album_Itemv9
    obj = nil
    [@ms_offsite].each do |ms|
      assert_raise(MySpace::RestException) do 
        obj = ms.get_mediaitems_by_mediaid(PERSON_ID,ALBUM_ID,"1234")
      end
      assert_nothing_raised do
        obj = ms.get_mediaitems_by_mediaid(PERSON_ID,ALBUM_ID,'myspace.com.mediaItem.image.'+PHOTO_ID)
      end
      assert_not_equal('0', obj['totalResults'])
      mediaItem = obj['mediaItem']
      assert_instance_of(Hash, mediaItem)
      assert_equal(5, mediaItem.length)
      title = mediaItem['title']
      assert_instance_of(String, title)
      assert_equal('', title)
    end
  end  
end
