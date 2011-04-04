module MySpace
  
   class RestV1
     
     @context =nil
      def initialize(myspaceContext)
        @context=myspaceContext
      end
    EndPoint.define(:user_info,                'http://api.myspace.com/v1/user',                                     :get,    :v1_json)
    EndPoint.define(:albums,                   'http://api.myspace.com/v1/users/{user_id}/albums',                   :get,    :v1_json)
    EndPoint.define(:album_info,               'http://api.myspace.com/v1/users/{user_id}/albums/{album_id}',        :get,    :v1_json)
    EndPoint.define(:album,                    'http://api.myspace.com/v1/users/{user_id}/albums/{album_id}/photos', :get,    :v1_json)
    EndPoint.define(:friends,                  'http://api.myspace.com/v1/users/{user_id}/friends',                  :get,    :v1_json)
    EndPoint.define(:friendship,               'http://api.myspace.com/v1/users/{user_id}/friends/{friend_ids}',     :get,    :v1_json)
    EndPoint.define(:friends_list,             'http://api.myspace.com/v1/users/{user_id}/friendslist/{friend_ids}', :get,    :v1_json)
    EndPoint.define(:mood_get,                 'http://api.myspace.com/v1/users/{user_id}/mood',                     :get,    :v1_json)
    EndPoint.define(:mood_put,                 'http://api.myspace.com/v1/users/{user_id}/mood',                     :put)
    EndPoint.define(:moods,                    'http://api.myspace.com/v1/users/{user_id}/moods',                    :get,    :v1_json)
    EndPoint.define(:photos,                   'http://api.myspace.com/v1/users/{user_id}/photos',                   :get,    :v1_json)
    EndPoint.define(:photo,                    'http://api.myspace.com/v1/users/{user_id}/photos/{photo_id}',        :get,    :v1_json)
    EndPoint.define(:profile,                  'http://api.myspace.com/v1/users/{user_id}/profile',                  :get,    :v1_json)
    EndPoint.define(:status_get,               'http://api.myspace.com/v1/users/{user_id}/status',                   :get,    :v1_json)
    EndPoint.define(:status_put,               'http://api.myspace.com/v1/users/{user_id}/status',                   :put)
    EndPoint.define(:videos,                   'http://api.myspace.com/v1/users/{user_id}/videos',                   :get,    :v1_json)
    EndPoint.define(:video,                    'http://api.myspace.com/v1/users/{user_id}/videos/{video_id}',        :get,    :v1_json)
    EndPoint.define(:activities,               'http://api.myspace.com/v1/users/{user_id}/activities.atom',          :get)
    EndPoint.define(:friends_activities,       'http://api.myspace.com/v1/users/{user_id}/friends/activities.atom',  :get)
    EndPoint.define(:appdata_global_get,       'http://api.myspace.com/v1/appdata/global',                           :get,    :v1_json)
    EndPoint.define(:appdata_global_keys_get,  'http://api.myspace.com/v1/appdata/global/{keys}',                    :get,    :v1_json)
    EndPoint.define(:appdata_global_put,       'http://api.myspace.com/v1/appdata/global',                           :put)
    EndPoint.define(:appdata_global_delete,    'http://api.myspace.com/v1/appdata/global/{keys}',                    :delete)
    EndPoint.define(:appdata_user_get,         'http://api.myspace.com/v1/users/{user_id}/appdata',                  :get,    :v1_json)
    EndPoint.define(:appdata_user_keys_get,    'http://api.myspace.com/v1/users/{user_id}/appdata/{keys}',           :get,    :v1_json)
    EndPoint.define(:appdata_user_put,         'http://api.myspace.com/v1/users/{user_id}/appdata',                  :put)
    EndPoint.define(:appdata_user_delete,      'http://api.myspace.com/v1/users/{user_id}/appdata/{keys}',           :delete)
    EndPoint.define(:appdata_friends_get,      'http://api.myspace.com/v1/users/{user_id}/friends/appdata',          :get,    :v1_json)
    EndPoint.define(:appdata_friends_keys_get, 'http://api.myspace.com/v1/users/{user_id}/friends/appdata/{keys}',   :get,    :v1_json)
    #sz
    EndPoint.define(:indicators, 'http://api.myspace.com/v1/users/{user_id}/indicators',                              :get,    :v1_json)
    EndPoint.define(:comments, 'http://api.myspace.com/v1/users/{user_id}/comments',                                  :get,    :v1_json)
    EndPoint.define(:notification, 'http://api.myspace.com/v1/applications/{application_id}/notifications',           :put)   
    
    # Get the user id of the currently logged in user.
    def get_userid()
      user_info = @context.call_myspace_api(:user_info, :v1_json => true)
      user_info['userId'].to_s
    end

    # Get the photo album descriptions for the user +user_id+:
    #
    #   {"albums"=>
    #     [{"photosUri"=>
    #        "http://api.myspace.com/v1/users/456073223/albums/40418/photos",
    #        "photoCount"=>1,
    #        "location"=>"",
    #        "title"=>"My Photos",
    #        "id"=>40418,
    #        "defaultImage"=>
    #        "http://c1.ac-images.myspacecdn.com/images02/45/m_f820313641924f0f90004932c8bc310c.jpg",
    #        "privacy"=>"Everyone",
    #        "user"=>
    #        {"name"=>"Bob",
    #          "uri"=>"http://api.myspace.com/v1/users/456073223",
    #          "webUri"=>"http://www.myspace.com/bobvontestacount",
    #          "largeImage"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #          "userType"=>"RegularUser",
    #          "userId"=>456073223,
    #          "image"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #        "albumUri"=>"http://api.myspace.com/v1/users/456073223/albums/40418"}],
    #     "count"=>1,
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_albums(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:albums, params.dup.update(:user_id => user_id, :v1_json => true))
    end



    # Get the photo album description for user +user_id+ and album +album_id+
    #
    # {"photosUri"=>"http://api.myspace.com/v1/users/456073223/albums/40418/photos",
    #  "photoCount"=>1,
    #  "location"=>"",
    #  "title"=>"My Photos",
    #  "id"=>40418,
    #  "defaultImage"=>
    #    "http://c1.ac-images.myspacecdn.com/images02/45/m_f820313641924f0f90004932c8bc310c.jpg",
    #  "privacy"=>"Everyone",
    #  "user"=>
    #    {"name"=>"Bob",
    #    "uri"=>"http://api.myspace.com/v1/users/456073223",
    #    "webUri"=>"http://www.myspace.com/bobvontestacount",
    #    "largeImage"=>
    #    "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #    "userType"=>"RegularUser",
    #    "userId"=>456073223,
    #    "image"=>
    #    "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #  "albumUri"=>"http://api.myspace.com/v1/users/456073223/albums/40418"}
    def get_album_info(user_id, album_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      album_id = album_id.to_s
      @context.validate_identifier(:album_id, album_id)
      @context.call_myspace_api(:album_info, params.dup.update(:user_id => user_id, :album_id => album_id, :v1_json => true))
    end

    # Get the photo descriptions for the photos of album +album_id+
    # for the user +user_id+:
    #
    #   {"photos"=>
    #     [{"smallImageUri"=>
    #        "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg",
    #        "photoUri"=>
    #        "http://api.myspace.com/v1/users/456073223/albums/40418/photos/100809",
    #        "id"=>100809,
    #        "uploadDate"=>"2/27/2009 10:14:12 AM",
    #        "caption"=>"",
    #        "lastUpdatedDate"=>"",
    #        "imageUri"=>
    #        "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #        "user"=>
    #        {"name"=>"Bob",
    #          "uri"=>"http://api.myspace.com/v1/users/456073223",
    #          "webUri"=>"http://www.myspace.com/bobvontestacount",
    #          "largeImage"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #          "userType"=>"RegularUser",
    #          "userId"=>456073223,
    #          "image"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}],
    #     "count"=>1,
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_album(user_id, album_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      album_id = album_id.to_s
      @context.validate_identifier(:album_id, album_id)
      @context.call_myspace_api(:album, params.dup.update(:user_id => user_id, :album_id => album_id, :v1_json => true))
    end

    # Gets the list of friends for the user +user_id+:
    #
    #   {"topFriends"=>"http://api.myspace.com/v1/users/456073223/friends?list=top",
    #     "Friends"=>
    #     [{"name"=>"Tom",
    #        "uri"=>"http://api.myspace.com/v1/users/6221",
    #        "webUri"=>"http://www.myspace.com/tom",
    #        "largeImage"=>"http://b2.ac-images.myspacecdn.com/00000/20/52/2502_l.jpg",
    #        "userType"=>"RegularUser",
    #        "userId"=>6221,
    #        "image"=>"http://b2.ac-images.myspacecdn.com/00000/20/52/2502_s.jpg"}],
    #     "count"=>1,
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_friends(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:friends, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Tests whether user +user_id+ is friends with one or more other users:
    #
    #   {"friendship"=>
    #     [{"areFriends"=>true, "friendId"=>6221},
    #      {"areFriends"=>false, "friendId"=>12341234},
    #      {"areFriends"=>true, "friendId"=>456073223}],
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_friendship(user_id, *friend_ids)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      friend_ids.each do |friend_id|
        friend_id = friend_id.to_s
        @context.validate_identifier(:friend_ids, friend_id)
      end
      @context.call_myspace_api(:friendship, :user_id => user_id, :friend_ids => friend_ids.join(';'), :v1_json => true)
    end

    # Gets the list of friends for the user +user_id+, for the friends
    # in +friend_ids+.  Use this call if you only need information
    # about a specific set of friends whose ids you already know.
    def get_friends_list(user_id, *friend_ids)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      friend_ids.each do |friend_id|
        friend_id = friend_id.to_s
        @context.validate_identifier(:friend_ids, friend_id)
      end
      @context.call_myspace_api(:friends_list, :user_id => user_id, :friend_ids => friend_ids.join(';'), :v1_json => true)
    end

    # Gets the mood of user +user_id+:
    #
    #   {"mood"=>"tested",
    #     "moodImageUrl"=>
    #     "http://x.myspacecdn.com/images/blog/moods/iBrads/indescribable.gif",
    #     "moodLastUpdated"=>"2/27/2009 10:19:25 AM",
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_mood(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:mood_get, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Sets the mood of the user +user_id+ to +mood_id+, which must be
    # a number from this list:
    #
    # http://wiki.developer.myspace.com/index.php?title=Myspace_mood_data_names_codes_images
    def set_mood(user_id, mood_id)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      mood_id = mood_id.to_s
      @context.validate_identifier(:mood_id, mood_id)
      @context.call_myspace_api(:mood_put, :user_id => user_id, :body => {:mood => mood_id})
    end

    # Gets and caches the list of available moods for user +user_id+.
    def moods(user_id)
      @moods ||= {}
      @moods[user_id] ||= get_moods(user_id)
    end

    # Gets the mood names available for user +user_id+.
    def mood_names(user_id)
      moods(user_id).collect do |mood|
        mood['moodName']
      end
    end

    # Given a +user_id+ and the name of a mood, returns the
    # corresponding mood id
    def mood_id(user_id, name)
      moods(user_id).each do |mood|
        return mood['moodId'] if mood['moodName'] == name
      end
    end

    # Gets the list of available moods for user +user_id+.
    def get_moods(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      moods = @context.call_myspace_api(:moods, params.dup.update(:user_id => user_id, :v1_json => true))
      moods['moods']
    end

    # Gets the photo descriptions for the photos that belong to user +user_id+:
    #
    #   {"photos"=>
    #     [{"smallImageUri"=>
    #        "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg",
    #        "photoUri"=>"http://api.myspace.com/v1/users/456073223/photos/100809",
    #        "id"=>100809,
    #        "uploadDate"=>"2/27/2009 10:14:12 AM",
    #        "caption"=>"",
    #        "lastUpdatedDate"=>"",
    #        "imageUri"=>
    #        "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #        "user"=>
    #        {"name"=>"Bob",
    #          "uri"=>"http://api.myspace.com/v1/users/456073223",
    #          "webUri"=>"http://www.myspace.com/bobvontestacount",
    #          "largeImage"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #          "userType"=>"RegularUser",
    #          "userId"=>456073223,
    #          "image"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}],
    #     "count"=>1,
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_photos(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:photos, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Gets the photo description for photo +photo_id+ for user +user_id+:
    #
    #   {"smallImageUri"=>
    #     "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg",
    #     "photoUri"=>"http://api.myspace.com/v1/users/456073223/photos/100809",
    #     "id"=>100809,
    #     "uploadDate"=>"2/27/2009 10:14:12 AM",
    #     "caption"=>"",
    #     "lastUpdatedDate"=>"",
    #     "imageUri"=>
    #     "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_photo(user_id, photo_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      photo_id = photo_id.to_s
      @context.validate_identifier(:photo_id, photo_id)
      @context.call_myspace_api(:photo, params.dup.update(:user_id => user_id, :photo_id => photo_id, :v1_json => true))
    end

    # Gets the profile info for user +user_id+:
    #
    #   {"region"=>"California",
    #     "city"=>"BEVERLY HILLS",
    #     "country"=>"US",
    #     "postalcode"=>"90210",
    #     "gender"=>"Male",
    #     "type"=>"full",
    #     "culture"=>"en-US",
    #     "aboutme"=>"",
    #     "hometown"=>"",
    #     "basicprofile"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userId"=>456073223,
    #       "lastUpdatedDate"=>"2/27/2009 10:20:02 AM",
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #     "age"=>88,
    #     "maritalstatus"=>"Single"}
    def get_profile(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:profile, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Gets the status of user +user_id+:
    #
    #   {"mood"=>"tested",
    #     "moodImageUrl"=>
    #     "http://x.myspacecdn.com/images/blog/moods/iBrads/indescribable.gif",
    #     "moodLastUpdated"=>"2/27/2009 10:19:25 AM",
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #     "status"=>"Testing"}
    def get_status(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:status_get, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Sets the status of the user +user_id+
    def set_status(user_id, status)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:status_put, :user_id => user_id, :body => {:status => status})
    end

    # Gets the video descriptions for the videos of user +user_id+:
    #
    #   {"videos"=>
    #     [{"totalrating"=>"0",
    #        "title"=>"110403na",
    #        "resourceuserid"=>"456073223",
    #        "mediastatus"=>"ProcessingSuccessful",
    #        "dateupdated"=>"3/5/2009 11:24:23 AM",
    #        "country"=>"US",
    #        "totalviews"=>"0",
    #        "thumbnail"=>
    #        "http://d4.ac-videos.myspacecdn.com/videos02/8/thumb1_1bd4f5fde59540c2981c35b27c15a0f3.jpg",
    #        "language"=>"en",
    #        "id"=>53551799,
    #        "totalcomments"=>"0",
    #        "runtime"=>"219",
    #        "datecreated"=>"3/5/2009 11:24:23 AM",
    #        "privacy"=>"Public",
    #        "mediatype"=>"4",
    #        "description"=>"110403na",
    #        "user"=>
    #        {"name"=>"Bob",
    #          "uri"=>"http://api.myspace.com/v1/users/456073223",
    #          "webUri"=>"http://www.myspace.com/bobvontestacount",
    #          "largeImage"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #          "userType"=>"RegularUser",
    #          "userId"=>456073223,
    #          "image"=>
    #          "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #        "totalvotes"=>"0",
    #        "videoUri"=>"http://api.myspace.com/v1/users/456073223/videos/53551799"}],
    #     "count"=>1,
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"}}
    def get_videos(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:videos, params.dup.update(:user_id => user_id, :v1_json => true))
    end

    # Gets the video description for the video +video_id+ of user +user_id+:
    #
    #   {"totalrating"=>"0",
    #     "title"=>"110403na",
    #     "resourceuserid"=>"456073223",
    #     "mediastatus"=>"ProcessingSuccessful",
    #     "dateupdated"=>"3/5/2009 11:24:23 AM",
    #     "country"=>"US",
    #     "totalviews"=>"0",
    #     "thumbnail"=>
    #     "http://d1.ac-videos.myspacecdn.com/videos02/8/thumb1_461592d881c14023bcb6a73275ebc614.jpg",
    #     "language"=>"en",
    #     "id"=>53551799,
    #     "totalcomments"=>"0",
    #     "runtime"=>"219",
    #     "datecreated"=>"3/5/2009 11:24:23 AM",
    #     "privacy"=>"Public",
    #     "mediatype"=>"4",
    #     "description"=>"110403na",
    #     "user"=>
    #     {"name"=>"Bob",
    #       "uri"=>"http://api.myspace.com/v1/users/456073223",
    #       "webUri"=>"http://www.myspace.com/bobvontestacount",
    #       "largeImage"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/l_f820313641924f0f90004932c8bc310c.jpg",
    #       "userType"=>"RegularUser",
    #       "userId"=>456073223,
    #       "image"=>
    #       "http://c1.ac-images.myspacecdn.com/images02/45/s_f820313641924f0f90004932c8bc310c.jpg"},
    #     "totalvotes"=>"0",
    #     "videoUri"=>"http://api.myspace.com/v1/users/456073223/videos/53551799"}
    def get_video(user_id, video_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      video_id = video_id.to_s
      @context.validate_identifier(:video_id, video_id)
      @context.call_myspace_api(:video, params.dup.update(:user_id => user_id, :video_id => video_id, :v1_json => true))
    end

    # Gets the activity stream of user +user_id+
    def get_activities(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:activities, params.dup.update(:user_id => user_id))
    end

    # Gets the activity streams of the friends of user +user_id+
    def get_friends_activities(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:friends_activities, params.dup.update(:user_id => user_id))
    end
    
    # Gets the global application data.  This can be anything the
    # application wants.  If you pass +keys+, only return data
    # corresponding to the passed keys.
    def get_global_appdata(*keys)
      context.appdata_to_hash do
        if keys.length > 0
          @context.call_myspace_api(:appdata_global_keys_get, :keys => keys.join(';'), :v1_json => true)
        else
          @context.call_myspace_api(:appdata_global_get, :v1_json => true)
        end
      end
    end
    #Sets the global application data.This can be anything that application wants
    def set_global_appdata(params = {})
      deletes = context.remove_null_values(params)
      @context.call_myspace_api(:appdata_global_put, :body => params) if params.length > 0
      @context.call_myspace_api(:appdata_global_delete, :keys => deletes.join(';')) if deletes.length > 0
    end
    #clears the global application data
    def clear_global_appdata(*keys)
      @context.call_myspace_api(:appdata_global_delete, :keys => keys.join(';'))
    end

    def get_user_appdata(user_id, *keys)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      context.appdata_to_hash do
        if keys.length > 0
          @context.call_myspace_api(:appdata_user_keys_get, :user_id => user_id, :keys => keys.join(';'), :v1_json => true)
        else
          @context.call_myspace_api(:appdata_user_get, :user_id => user_id, :v1_json => true)
        end
      end
    end

    def set_user_appdata(user_id, params = {})
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      deletes = context.remove_null_values(params)
      @context.call_myspace_api(:appdata_user_put, :user_id => user_id, :body => params) if params.length > 0
      @context.call_myspace_api(:appdata_user_delete, :user_id => user_id, :keys => deletes.join(';')) if deletes.length > 0
    end

    def clear_user_appdata(user_id, *keys)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:appdata_user_delete, :user_id => user_id, :keys => keys.join(';'))
    end

    def get_user_friends_appdata(user_id, *keys)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      if keys.length > 0
        @context.call_myspace_api(:appdata_friends_keys_get, :user_id => user_id, :keys => keys.join(';'), :v1_json => true)
      else
        @context.call_myspace_api(:appdata_friends_get, :user_id => user_id, :v1_json => true)
      end.inject({}) do |hash, friend|
        hash.update(friend['userid'].to_s => context.appdata_to_hash(friend))
      end
    end
    public

    def get_indicators(user_id)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:indicators, :user_id => user_id, :v1_json => true)
    end
    
    def get_comments(user_id)
      user_id = user_id.to_s
      @context.validate_identifier(:user_id, user_id)
      @context.call_myspace_api(:comments, :user_id => user_id, :v1_json => true)
    end
    
    def set_Notifications (application_Id, params = {})
      user_id = user_id.to_s
      application_Id= application_Id.to_s
      #@context.validate_identifier(:user_id, user_id)
      deletes = context.remove_null_values(params)
      @context.call_myspace_api(:notification, :application_id => application_Id, :body => params) if params.length > 0
    end
  end
end

  