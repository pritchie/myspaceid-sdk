require 'test/unit'
require 'myspace'

class TC_Albumsv9 < Test::Unit::TestCase
  include MySpaceTest

  def test_albumsv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_albums(value)
        end
      end
      assert_nothing_raised do
        obj = ms.get_albums(USER_ID)
      end
      assert_operator('0','<', obj['totalResults'])
      albums = obj['entry'][0]
      assert_instance_of(Hash, albums)
      assert_equal(1, albums.length)
      album = albums['album']
      assert_instance_of(Hash, album)
      album_id = album['id'].to_s
      assert_not_equal('', album_id)
      title = album['title']
      assert_instance_of(String, title)
     
    end
  end
  
  
  def test_albumv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_album_by_id(value, ALBUM_ID)
        end
      end
      BAD_IDS.each do |value|
        assert_raise(MySpace::BadIdentifier) do
          obj = ms.get_album_by_id(USER_ID, value)
        end
      end
      assert_raise(MySpace::RestException) do 
        obj = ms.get_album_by_id(USER_ID, "1234")
      end
      assert_nothing_raised do
        obj = ms.get_album_by_id(USER_ID, ALBUM_ID)
      end
      assert_equal('1', obj['totalResults'])
      album = obj['album']
      assert_instance_of(Hash, album)
      assert_equal(4, album.length)
      caption = album['caption']
      assert_instance_of(String, caption)
      assert_not_equal('', caption)
    end
  end
  

    def test_createalbumv9
    obj = nil
    [@ms_offsite].each do |ms|
     assert_nothing_raised do
        obj = ms.create_album(PERSON_ID, 'Caption','')
      end
    end
  end
  def test_updatealbumv9
    obj = nil
    [@ms_offsite].each do |ms|
     assert_nothing_raised do
        obj = ms.update_album(PERSON_ID,ALBUM_ID, 'caption', location='', privacy='Everyone')
      end
    end
  end
  
  
end
