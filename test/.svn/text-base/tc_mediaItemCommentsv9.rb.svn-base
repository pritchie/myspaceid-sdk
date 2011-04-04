require 'test/unit'
require 'myspace'

class TC_MediaItemCommentsV9 < Test::Unit::TestCase
  include MySpaceTest

  def test_mediaItems_commentsv9
    obj = nil
    [@ms_offsite, @ms_onsite].each do |ms|
        assert_nothing_raised do
        obj = ms.get_mediaitems_comments(USER_ID,ALBUM_ID,PHOTO_ID)
      end
      assert_not_equal('0', obj['totalResults'])
      assert_equal(PHOTO_ID, obj['id'])
      entry = obj['entry']
      assert_instance_of(Array, entry)
    end
  end
end
