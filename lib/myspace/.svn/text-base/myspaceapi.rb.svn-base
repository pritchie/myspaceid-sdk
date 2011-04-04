require 'myspace/context/MySpaceContext.rb'
require 'myspace/API/OpenSearch'

module MySpace
  # The MySpaceAPI object provides access to the MySpace REST API.
  # use this class to access all the functions
 
  class MySpaceAPI

    attr_reader :consumer
    attr_accessor :http_logger
    attr_accessor :request_token
    attr_accessor :access_token
  
    # Save the application key/secret(s) and initialize OAuth code.
    #
    # If optional param +:application_type+ is passed, it must be one
    # of +MySpace::MySpaceContext::APPLICATION_TYPE_ONSITE+ or
    # +MySpace::MySpaceContext::APPLICATION_TYPE_OFFSITE+.  
    # If the application is an
    # onsite application, an access token is not required, since the
    # user must separately give your application permission to access
    # their data.  If the application is an offsite application, it
    # must get an access token from the user to access their data.
    #
    # If optional param +:request_token+ is passed
    # +:request_token_secret+ must also be passed, and they will be
    # used to create the default argument to
    # +MySpace#get_access_token+ below.  If optional param
    # +:access_token+ is passed, +:access_token_secret+ must also be
    # passed, and they will be used to create the access token for the
    # REST API calls.
    #
    # If optional param +:site+ is passed, it must be either +:prod+
    # or +:stage+, and MySpace OAuth calls will be directed to either
    # the production or stage API server accordingly.
    def initialize(oauth_token_key, oauth_token_secret, params = {})
       @myspacecontext = MySpace::MySpaceContext.new(oauth_token_key, oauth_token_secret, params )
       @myspacecontext.http_logger= params[:http_logger]
       @consumer = @myspacecontext.consumer
       @request_token= @myspacecontext.request_token
       @restv1 =RestV1.new(@myspacecontext)
       @restv9 =RestV9.new(@myspacecontext)
       @poco = PortableContact.new(@myspacecontext)
       @realstream = RealStream.new(@myspacecontext)
       @opensearch =OpenSearch.new(@myspacecontext)
   end
    # Get an access token once the user has authorized us.
    def get_access_token(request_tken=nil,params={})
      if @request_token != nil
        request_tken=@request_token
      end
        @myspacecontext.get_access_token(request_tken,params)
    end
    # Get an unauthorized request token from MySpace.
    def get_request_token(oauth_callback)
        @myspacecontext.get_request_token(oauth_callback)
    end
    
    def get_authorization_url(request_token, callback_url)
        @myspacecontext.get_authorization_url(request_token, callback_url)
    end
    
    def get_userid()
      @restv1.get_userid
  end
  
  
  
  
#    Open Search
#     Resource: http://api.myspace.com/opensearch/people?
#     Details:  http://wiki.developer.myspace.com/index.php?title=Open_Search
#     Description: Get People Search
#     @param mixed   $searchTerms   (mandatory parameter)search keywords
#     @param integer $startIndex    Indicates the index of the first item to retrieve from the query set
#     @param integer $count            total number of records
#     @param string  $searchBy      which field the search should go through. Default is all the fields (yomi is only available to ja-jp culture) [ex. searchBy=name or searchBy=displayname or searchBy=email or searchBy=yomi] 
#     @param string  $gender        the gender to filter on; default is no preference or both [ex. gender=m or gender=f] 
#     @param bool    $hasPhoto      filter for those who only has photo; default is either [ex. hasPhoto=on] 
#     @param integer $minAge        minimum age to start the search (same filter as site search) [ex. minAge=18] 
#     @param integer $maxAge        maximum age to end the search with (same filter as site search) [ex. maxAge=68] 
#     @param string  $location      the location field such as city state and country to search for [ex. location=US] 
#     @param integer $distance      distance away from location to return results; default is miles; depending on culture passed in it can be kilometers [ex. distance=25] 
#     @param mixed   $latitude         geo latitude to search; combination with longitude required when used [ex. latitude=1] (does not work with location field) 
#     @param mixed   $longitude     geo longtitude to search; combination with latitude is required when used [ex. longitude=1] (does not work with location field) 
#     @param string  $culture         the culture context of the search; for instance japan is ja-jp; default is en-us [ex. culture=en-us] 
#     @param string  $countryCode   countryCode to search with [ex. countryCode=CA] (this is similar to culture=en-CA) 
#     @return object of python object representing the JSON in which the list of search
# 
   def search_people(searchterm,params={})
    @opensearch.search_people(searchterm,params)   
  end
  
#   Open Search
#     Resource: http://api.myspace.com/opensearch/images?
#     Details:  http://wiki.developer.myspace.com/index.php?title=Open_Search
#     Description: Get Image Search
#     @param mixed   $searchTerms   (mandatory parameter)search keywords
#     @param integer $startIndex    Indicates the index of the first item to retrieve from the query set
#     @param integer $count            total number of records
#     @param string  $searchBy      which field the search should go through. Default is all the fields (yomi is only available to ja-jp culture) [ex. searchBy=name or searchBy=displayname or searchBy=email or searchBy=yomi] 
#     @param string  $culture         the culture context of the search; for instance japan is ja-jp; default is en-us [ex. culture=en-us] 
#     @param string  $sortBy        Ways to sort the images; when excluded sortBy is all [ex. sortBy=popular or sortBy=recent]
#     @param string  $sortOrder     Order of the image sorting which can be descending (default) or ascending [ex. sortOrder=asc] 
#     @return object of python object representing the JSON in which the list of search
   def search_images(searchterm,params={})
    @opensearch.search_images(searchterm,params)   
   end
  
#   Open Search
#     Resource: http://api.myspace.com/opensearch/video?
#     Details:  http://wiki.developer.myspace.com/index.php?title=Open_Search
#     Description: Get Video Search
#     @param mixed   $searchTerms   (mandatory parameter)search keywords
#     @param integer $startIndex    Indicates the index of the first item to retrieve from the query set
#     @param integer $count            total number of records
#     @param string  $searchBy      which field the search should go through. Default is all the fields (yomi is only available to ja-jp culture) [ex. searchBy=name or searchBy=displayname or searchBy=email or searchBy=yomi] 
#     @param string  $culture         the culture context of the search; for instance japan is ja-jp; default is en-us [ex. culture=en-us] 
#     @param string  $tag           Determine if this is a tag search [ex. tag=1] 
#     @param string  $videomode     Determine if this is a tag search [ex. videoMode=1 (music videos) or videoMode=2 (official)] 
#     @return object of python object representing the JSON in which the list of search
  def search_videos(searchterm,params={})
    @opensearch.search_videos(searchterm,params)   
   end
    
#    OpenSocial v0.9 - Get Profile Comments        
#        Resource:    http://opensocial.myspace.com/roa/09/profilecomments/@me/@self        
#        Description: Return all comments available for user profile.
#        Parameter:   @person_id (mandatory parameter) current person id 
#                     @fields (optional parameter). By default, the id of the comment author will be added 
#                     to the result set, give the fields=author to get more information on the author
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_ProfileComments  
    def get_profile_comments(person_id, params={})
      @restv9.get_profile_comments(person_id,params)
    end
    
    
#    OpenSocial v0.9 - Retrieve all Album supported Fields        
#       Resource:    http://opensocial.myspace.com/roa/09/albums/@supportedFields
#       Description: Return all fields available for albums
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Albums
    def get_album_fields()
      @restv9.get_album_field()
    end
    
#    OpenSocial v0.9 - Retrieve Albums       
#       Resource:    http://opensocial.myspace.com/roa/09/albums/@me/@self/%s
#       Description: Retrieve Albums return all albums available for user, 
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @fields (optional parameter) fields which you want to filter in response                     
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                     where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Albums    
    def get_albums(person_id, params={})
      @restv9.get_albums(person_id,params)
    end
    
    
#    OpenSocial v0.9 - Retrieve Album by ID       
#       Resource:    http://opensocial.myspace.com/roa/09/albums/@me/@self/%s
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Albums
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @album_id (mandatory parameter)pass the  album id  which you want to get in response.
#                    @fields  (optional) return fields which you need in response
#       Description: get_albumbyidv9 return a specific album based on passed alumb_id    
    def get_album_by_id(person_id, album_id, fields='@all')
      @restv9.get_album_by_id(person_id, album_id,fields)
    end
    
    
#    OpenSocial v0.9 - Add Album       
#       Resource:    http://opensocial.myspace.com/roa/09/albums/@me/@self       
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @caption (mandatory parameter)use in place of title. 
#                    @location (optional parameter) 
#                    @privacy  (optional parameter) specifies visibility for album, 
#                    it can be one of 'Everyone', 'FriendsOnly' or 'Me' 
#       Description: Creates new album with specified access or with default access of EveryOne (if not
#                    specified) 
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Albums
    def create_album(person_id, caption, location='', privacy='Everyone')
      @restv9.create_albumv9(person_id, caption, location, privacy)
    end

#
#   OpenSocial v0.9 - Update existing Album
#       Resource:   http://opensocial.myspace.com/roa/09/albums/@me/@self/%s
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @album_id (mandatory parameter)Id of album which you want to update
#                    @caption (Optional parameter)use in place of title. 
#                    @location (optional parameter) 
#                    @privacy  (optional parameter) specifies visibility for album, 
#                    it can be one of 'Everyone', 'FriendsOnly' or 'Me' 
#       Description: Update album with new values of parameters specified 
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Albums  
    def update_album(person_id,album_id, caption, location='', privacy='Everyone')
      @restv9.update_album(person_id,album_id, caption, location, privacy)
    end

#   OpenSocial v0.9 - Retrieve all media item supported Fields 
#       Resource:    http://opensocial.myspace.com/roa/09/mediaItems/@supportedFields      
#       Description: get the supported mediaitem fields 
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems    
    def get_mediaitem_fields()
      @restv9.get_mediaItems_fields()
    end
    
#   OpenSocial v0.9 - Get Media Items
#       Resource:    http://opensocial.myspace.com/roa/09/mediaItems/{personId}/{selector}/{albumId}/{mediaItemId}
#       Description: Retrieve items from an Album based on album_id
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @album_id (mandatory parameter)Id of album for which you want to get data
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records        
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems  
   def get_mediaitems(person_id, album_id, params={})
      @restv9.get_mediaItems(person_id, album_id, params)
    end
    
   
#    OpenSocial v0.9 - Get Media Items by ID
#       Resource:    http://opensocial.myspace.com/roa/09/mediaItems/{personId}/{selector}/{albumId}/{mediaItemId}
#       Description: Retrieve a single MediaItem from an Album based on album_id and media_id
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @album_id (mandatory parameter)Id of album for which you want to get data
#                    @media_id (mandatory parameter)Id of media items for which you want to get data
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records        
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems   
    def get_mediaitems_by_mediaid(person_id,album_id, media_id,params={})
      @restv9.get_mediaitems_by_mediaid(person_id,album_id, media_id,params)
    end

#     OpenSocial v0.9 - Get Media Items by Category
#       Resource:    #http://opensocial.myspace.com/roa/09/mediaitems/{personId}/@videos/@supportedcategories
#       Description: Retrieve supported categories
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me                            
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems
    def get_video_supportedcategories(person_id)
      @restv9.get_video_supportedcategories(person_id)
    end

#     OpenSocial v0.9 - Get Media Items by Category ID
#       Resource:    #http://opensocial.myspace.com/roa/09/mediaitems/{personId}/@videos/@supportedcategories/{categoryId}
#       Description: Retrieve MediaItem(Video) from supported cat
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me                            
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems 
    def get_videocatergories_by_id(person_id,cat_id)
      @restv9.get_video_supportedcategories_by_Id(person_id, cat_id)
    end

#    OpenSocial v0.9 - Add Photo
#        How to use this Method
#        Make sure you have image file (Say home_16.jpg) available in same folder where your source resides
#  img= open('D:\Projects\myspace\rubyFinalSVN\samples\rails\sample\app\controllers\home_16.jpg', "rb") {|io| io.read }
#        @uploadimage =myspace.add_photo(@user_id, 'caption', '1198371', img)
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems    
    def add_photo(person_id,caption,album_id,data)
      @restv9.add_photo(person_id,caption,album_id,data)
    end

#   OpenSocial v0.9 - Add Video
#        How to use this Method
#        Make sure you have video file (Say softboy.avi) available in same folder where your source resides
#        vdo= open('D:\Projects\myspace\rubyFinalSVN\samples\rails\sample\app\controllers\softboy.avi', "rb") {|io| io.read }
#        
#        @uploadVideo = myspace.add_video(@user_id, '@video', 'caption', 'description', 'tags', 'en-US', vdo, '13','video/x-msvideo')
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems   
   def add_video(person_id,album_id,caption,description,tags,language,data,mscategories,contentType,params={})
      @restv9.add_video(person_id, album_id, caption, description, tags, language, data, mscategories,contentType,params)
    end

    
#     OpenSocial v0.9 MediaItemComments
#       Resource:    http://opensocial.myspace.com/roa/09/mediaitemcomments/{personId}/@self/{albumId}/{mediaItemId}
#       Description: Get comments associated with media item, based on album_id and media_id
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @album_id (mandatory parameter)Id of album which you want to update
#                    @media_id (mandatory parameter)Id of media items for which you want to get data                    
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_MediaItemComments  
    def get_mediaitems_comments(person_id, album_id, media_id)
      @restv9.get_mediaItem_comments(person_id, album_id, media_id)
    end
  
  
#    OpenSocial v0.9 - Retrieve all activity supported Fields 
#       Resource:    http://opensocial.myspace.com/roa/09/activities/@supportedFields    
#       Description: Retrieve all activity supported fields
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems   
    def get_activites_supportedfields()
      @restv9.get_activites_supportedfields()
    end
  
  
#   OpenSocial v0.9 - Retrieve all supported verbs 
#       Resource:    http://opensocial.myspace.com/roa/09/activities/@supportedVerbs       
#       Description: Retrieve all activity supported verbs
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems  
    def get_activites_supportedverbs()
      @restv9.get_activites_supportedverbs()
    end
  
#  OpenSocial v0.9 - Retrieve all supported Object Types 
#       Resource:    http://opensocial.myspace.com/roa/09/activities/@supportedObjectTypes      
#       Description: Retrieve all activity supported Object Types
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_0.9_MediaItems    
    def get_activites_supportedtypes()
      @restv9.get_activites_supportedobjecttypes()
  end
  
#   OpenSocial v0.9 -Retrieve viewer activities     
#        Resource:    http://opensocial.myspace.com/roa/09/activities/{personId}/{selector}       
#        Description: Return all activities available for viewer
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @fields (optional parameter).------------------------------
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Activities  
  def get_activities(user_id,params={})
    @restv9.get_activitesv9(user_id, selector='@self',params)
  end
  
  
#  OpenSocial v0.9 - Retrieve friend activities.
#        Resource:    http://opensocial.myspace.com/roa/09/activities/{personId}/{selector}       
#        Description: Return all activities available for friend.
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @fields (optional parameter).specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Activities
  def get_friend_activities(user_id,params={})
    @restv9.get_activitesv9(user_id, selector='@friends',params)
  end
  
  
#  The function will get all of the activites of a user friend, provided that the current user and application have privilages to access it
#   
#     @param int|string $userId
#     @param unknown_type $culture
#     @param mixed $datetime A better limit on the activities returned is datetime because it allows the consumer to query 
#                            deltas and only processed what has changed. Pass a date that is less than 60 days ago as the maximum and default number of days back you can query is 60. 
#                            If you query more than that the system will only go as far back as 60. Example of querystring parameters is: datetime=06/21/2009
#    
#     @param string $activityTypes PhotoTagged|PhotoAdd|SongUpload|ProfileSongAdd|BlogAdd|ForumPosted|ForumTopicReply|VideoAdd|ProfileVideoUpdate|FavoriteVideoAdd|FriendAdd|JoinedGroup|FriendCategoryAdd|PersonalBandShowUpdate|EventPosting|EventAttending|ApplicationAdd
#     @param int    $pageSize      You can use this parameter to specify the number of atom entries returned in the stream
#     @param bool   $composite      Set this parameter to true t
#     @param bool   $composite      Set this parameter to true to get one atom entry for all activities of the same type on the same day. If the objects of the activities go into targets then they will be grouped by target. Ex: Max uploaded 5 photos into the album Medieval Times.
#     @param bool   $extensions    Pipe delimited list of options syndicating the activity stream. Name fo the query string parameter is "extensions" Example: &extensions=actor|subject
#    
#     @return SimpleXML a SimpleXML representation of an Activities ATOM Feed
  def get_friends_activities_atom(user_id,params={})
    @restv1.get_friends_activities(user_id, params)
  end
  
#
#OpenSocial v0.9 - Retrieve viewer activities by appID 
#        Resource:    http://opensocial.myspace.com/roa/09/activities/{personId}/{selector}       
#        Description: Return all activities available for viewer for an appID specified in parameter
#        Parameter:   @app_id (mandatory parameter) refers to applicaiton id for which user wants to check activities
#                     @fields (optional parameter).------------------------------                     
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Activities 
  def get_activities_by_appid(person_id,app_id,params={})
    @restv9.get_activites_by_appid(person_id,app_id,params)
  end  
  
  
  #  OpenSocial v0.9 - Retrieve friend activities by appID 
  #        Resource:    http://opensocial.myspace.com/roa/09/activities/{personId}/{selector}       
  #        Description: Return all activities available for friend for an appID specified in parameter
  #        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
  #                     @app_id (mandatory parameter) refers to applicaiton id for which user wants to check activities    
  #                     @fields (optional parameter).specific fields
  #        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Activities   
   def get_friendactivities_by_appid(person_id,app_id,params={})
      @restv9.get_activites_by_appid(person_id,app_id,params)
   end
  

#       Create an activity
#       {
#        "externalId":"myExternalId",
#        "id":"myspace.com.activity.-1",
#        "title":"osapi test activity at",
#        "body":"osapi test activity body",
#        "templateParams":{
#            "msParameters":[
#            {
#                "key":"friend",
#                "value":"6221"
#            },
#            {
#                "key":"content",
#                "value":"hello there this is my template param content"
#            }]
#        },
#        "titleId":"Template_4"
#    }
    def create_activity(person_id,externalId, title, msgBody, templateParams, titleId)
       @restv9.add_activites(person_id,externalId, title, msgBody, templateParams, titleId)
    end
#   
#OpenSocial v0.9 - Retrieve all/Single key in AppData for a single user 
#        Resource:    http://opensocial.myspace.com/roa/09/appdata/{personId}/{selector}/{appId}       
#        Description: Retrieve all AppData for a single user 
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @app_id (mandatory parameter) refers to applicaiton id for which user wants to get data    
#                     @fields (optional parameter).The fields correspond to keys in the AppData. One uses fields
#                      to only retrieve specific keys. If the request omits fields, all AppData per user will be returned.
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_AppData    
    def get_appdata(person_id, selector, app_id, field)
        @restv9.get_appdata(person_id, selector, app_id, field)
    end
  
#  
#  OpenSocial v0.9 - Add a single key to AppData for a single user
#        Resource:    http://opensocial.myspace.com/roa/09/appData/@me/@self/       
#        Description: Add a single key AppData for a single user 
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @app_id (mandatory parameter) refers to applicaiton id for which user wants to enter data    
#                     @key (mandatory parameter).refers to the name of key which will be entered
#                     @value (mandatory parameter).refers to the value of key which will be stored
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_AppData   
    def add_appdata(person_id, appId, key, value)
        @restv9.add_appdata(person_id, appId, key, value)
    end
    
#     OpenSocial v0.9 - Update a single key to AppData for a single user
#        Resource:    http://opensocial.myspace.com/roa/09/appData/@me/@self/       
#        Description: Add a single key AppData for a single user 
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @app_id (mandatory parameter) refers to applicaiton id for which user wants to update data    
#                     @key (mandatory parameter).refers to the name of key which will be updated
#                     @value (mandatory parameter).refers to the value of key which will be updated
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_AppData  
    def update_appdata(person_id, appId, key, value)
      @restv9.update_appdata(person_id, appId, key, value)
    end
    
    
#    OpenSocial v0.9 - Delete single key to AppData for a single user 
#        Resource:    http://opensocial.myspace.com/roa/09/appData/@me/@self/       
#        Description: Delete a single key AppData for a single user 
#        Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                     @app_id (mandatory parameter) refers to applicaiton id for which user wants to delete data    
#                     @fields (mandatory parameter).refers to the name of key which will be updated
#                     @value (mandatory parameter).refers to the value of key which will be updated
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_AppData
    def delete_appdata
      @restv9.delete_appdata(person_id, appId, field)
    end
    
#    OpenSocial v0.9 Groups- Retrieve all supported fields   
#       Resource:    http://opensocial.myspace.com/roa/09/groups/@supportedFields       
#       Description: Retrieve all group supported fields
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Groups    
    def get_group_supportedfields()
      @restv9.get_groups_supportedFields()
    end
    
#    OpenSocial v0.9 - Retrieve all groups for current user   
#       Resource:    http://opensocial.myspace.com/roa/09/groups/@me       
#       Description: Retrieve all groups for current user fields
#       Parameter:   @person_id (mandatory parameter) current person id e.g: @me
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_Groups  
    def get_groups(person_id,params={})
      @restv9.get_groups(person_id,params)
    end
    
   
#    OpenSocial v0.9 People- Retrieve all supported fields   
#       Resource:    http://opensocial.myspace.com/roa/09/people/@supportedFields        
#       Description: Retrieve all people supported fields
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_People       
    def get_people_supportedfields()
      @restv9.get_people_supportedfileds()
     end
    
#    OpenSocial v0.9 People- Get my profile data   
#       Resource:    http://opensocial.myspace.com/roa/09/people/@me/@self        
#       Description: Get my profile data
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @fields     (optional parameter) specific fields
#                    @filterby   (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }                 
#                    @filterop   (optional parameter) some valid values : {contains | equals etc }
#                    @filtervalue(optional parameter) some valid values : {true | false | specific value etc }
#                    @format     (optional parameter)  Determines the format of the response. We currently support json and xml
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records                
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_People   
    def get_person(person_id,params={})
      @restv9.get_person(person_id,params.dup.update(:selector=>'@self'))
    end
    
#    OpenSocial v0.9 People- get my friends Data  
#       Resource:    http://opensocial.myspace.com/roa/09/people/{personId}/{selector}/{friendId}       
#       Description: get my friends Data
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @fields     (optional parameter)
#                    @filterby   (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }                 
#                    @filterop   (optional parameter) some valid values : {contains | equals etc }
#                    @filtervalue(optional parameter) some valid values : {true | false | specific value etc }
#                    @format     (optional parameter) Determines the format of the response. We currently support json and xml
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records                
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_People           
    def get_friends(person_id,params={})
      @restv9.get_person(person_id,params.dup.update(:selector=>'@friends'))
    end


#OpenSocial v0.9 People- get a perticular friend Data  
#       Resource:    http://opensocial.myspace.com/roa/09/people/{personId}/{selector}/{friendId}       
#       Description: get a perticular friend Data 
#       Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    @fields     (optional parameter) specific fields
#                    @filterby   (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }                 
#                    @filterop   (optional parameter) some valid values : {contains | equals etc }
#                    @filtervalue(optional parameter) some valid values : {true | false | specific value etc }
#                    @format     (optional parameter) Determines the format of the response. We currently support json and xml
#                    @startindex (optional parameter)  startIndex must be in the form of startIndex = (count * i) + 1,
#                    where i is any non-negative integer, 
#                    e.g. if count = 5, startIndex can be 1, 6, 11, 16, etc.
#                    @count (optional parameter) total number of records                
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_People   
    def get_people_by_friendid(person_id, friend_id,params={})
      @restv9.get_people_by_friendId(person_id, friend_id,params)
    end


#OpenSocial v0.9 StatusMood - Retrieve all supported moods    
#       Resource:    http://opensocial.myspace.com/roa/09/statusmood/@me/@supportedMood      
#       Description: Retrieve all supported moods 
#       Parameters:  person_id (mandatory parameter) current person id e.g: @me                       
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood 
    def get_moods_supported(person_id)
      @restv9.get_mood_supported(person_id)
    end
    
#    OpenSocial v0.9 StatusMood - Retrieve all supported moods by id 
#       Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/@supportedMood/{moodId}      
#       Description: Retrieve all supported moods by id  
#       Parameters:  person_id current person id e.g: @me       
#                    mood_id   id of mood which you want to retrive                
#       Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood 
    def get_supportedsmoodbyid(person_id,moodId)
      @restv9.get_mood_supported_by_moodId(person_id, moodId)
    end
    
    
#     OpenSocial v0.9 Retrieve a status & mood for user
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}
#        Description: Retrieve a status & mood for user
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me 
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
    def get_statusmood(person_id)
      @restv9.get_statusmood(person_id, params = {})
    end
    
#OpenSocial v0.9 Retrieve a status & mood for all Friends
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}
#        Description: Retrieve a status & mood for all Friends
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me 
#                     @filterby (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }
#                     @filterop (optional parameter) some valid values : {contains | equals etc }
#                     @filtervalue (optional parameter)  some valid values : {true | false | specific value etc }
#                     @includeself (optional parameter) current user should included or not
#                     @culture (optional parameter) culture for which you wan to select value
#                     @fields (optional parameter) specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood    
    def get_friends_statusmood(person_id)
      @restv9.get_friends_statusmood(person_id, params = {})
    end
    
#    OpenSocial v0.9 Retrieve a status & mood history for user
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}/history 
#        Description: Retrieve a status & mood history for user
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me 
#                     @fields (optional parameter) specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
    def get_self_statusmood_history(person_id)
      @restv9.get_self_statusmood_history(person_id, params = {})
    end


#OpenSocial v0.9 Retrieve a status & mood history for friends
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}/history 
#        Description: Retrieve a status & mood history for friends
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me 
#                     @filterby (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }
#                     @filterop (optional parameter) some valid values : {contains | equals etc }
#                     @filtervalue (optional parameter)  some valid values : {true | false | specific value etc }
#                     @includeself (optional parameter) current user should included or not
#                     @culture (optional parameter) culture for which you wan to select value
#                     @fields (optional parameter) specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
   def get_friends_statusmood_history(person_id, params = {})
     @restv9.get_friends_statusmood_history(person_id, params = {})
   end

#OpenSocial v0.9 Retrieve a status & mood history for a particular friend
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}/history 
#        Description: Retrieve a status & mood for a friend
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me 
#                     @friend_id (mandatory parameter) id of friend for which you want to retreive data
#                     @filterby (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }
#                     @filterop (optional parameter) some valid values : {contains | equals etc }
#                     @filtervalue (optional parameter)  some valid values : {true | false | specific value etc }
#                     @includeself (optional parameter) current user should included or not
#                     @culture (optional parameter) culture for which you wan to select value
#                     @fields (optional parameter) specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
    def get_friends_statusmood_by_friendid(person_id, friend_id, params = {})
      @restv9.get_friends_statusmood_by_friendid(person_id, friend_id, params = {})
    end
    
#    OpenSocial v0.9 Retrieve a status & mood history for a particular friend
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/{personId}/{selector}/history 
#        Description: Retrieve a status & mood for a friend
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                     @friend_id (mandatory parameter) id of friend for which you want to retreive data 
#                     @filterby (optional parameter) some valid values : {topFriends | toponlineFriends | hasApp etc }
#                     @filterop (optional parameter) some valid values : {contains | equals etc }
#                     @filtervalue (optional parameter)  some valid values : {true | false | specific value etc }
#                     @includeself (optional parameter) current user should included or not
#                     @culture (optional parameter) culture for which you wan to select value
#                     @fields (optional parameter) specific fields
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
    def get_friends_statusmood_history_by_friendid(person_id, friend_id, params = {})
      @restv9.get_friends_statusmood_history_by_friendid(person_id, friend_id, params = {})
    end
#
#  OpenSocial v0.9 Update Status Mood
#        Resource:    http://opensocial.myspace.com/roa/09/statusmood/@me/@self 
#        Description: Update/Set Status Mood
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                    Possible values for option parameters
#                    {
#                    "currentLocation":{
#                        "latitude":"47.604832",
#                        "longitude":"-122.337549"
#                    },
#                    "moodName":"excited",
#                    "status":"Working on Ruby SDK"
#                    }    
#                    Example : 
#                    set_statusv9(person_id="@me",latitude='47',longitude='122',moodname='excited',status='Pythond SDK Completed')                
#        Details:     http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMood
    def set_status(person_id,latitude, longitude, moodName, status)
      @restv9.set_status(person_id,latitude, longitude, moodName, status)
    end
    
#    OpenSocial v0.9 Get StatusMoodComments
#        Resource:    http://opensocial.myspace.com/roa/09/statusmoodcomments/{personId}/@self  
#        Description: Get all Status mood comments
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me  
#                     @statusid id of moodstatus for which comment is posted                                   
#        Details:    http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMoodComments
    def get_statusmood_comments (person_id,status_id)
      @restv9.get_statusmood_comments(person_id, status_id)
    end
    
#    
#    OpenSocial v0.9 Add StatusMoodComments
#        Resource:    #http://opensocial.myspace.com/roa/09/statusmoodcomments/{personId}/@self?statusId={statusId} 
#        Description: Set Status mood comments for a particular person
#        Parameters:  @person_id (mandatory parameter) current person id e.g: @me
#                     @body (mandatory parameter) body of status comment
#                     @statusid(mandatory paramter) id of parameter for which comment is posted                                    
#        Details:    http://wiki.developer.myspace.com/index.php?title=OpenSocial_v0.9_StatusMoodComments
    def add_statusmoodcomment (person_id, status_id,body)
      @restv9.add_statusmoodcomment(person_id,status_id,body)
    end
    
#    OpenSocial v0.9 Notifications
#        send_notification Usage:
#        
#        ms = MySpace(ckeynsecret.CONSUMER_KEY, ckeynsecret.CONSUMER_SECRET)
#          templateparam ='[{"key":"content","value":"Test notification content from python sdk"},\
#                                {"key":"button0_surface","value":"canvas"},\
#                                {"key":"button0_label","value":"Go To App Canvas"},\
#                                {"key":"button1_label","value":"Go To App Profile"}]'
#              notification_data = ms.send_notification(person_id="333220680", recipientids="333220680", templateparams=templateparam, mediaitems='http://opensocial.myspace.com/roa/09/mediaitemcomments/333220680/@self')

    def send_notification(msMediaItemUri, recipientIds, canvasUrl, content)
      @restv9.send_notificationsv9(msMediaItemUri, recipientIds, canvasUrl, content)
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
    def get_friendship (user_id,*friend_id)
      @restv1.get_friendship(user_id, *friend_ids)
    end
    
    def get_indicators (user_id)
      @restv1.get_indicators(user_id)
    end
    
    
    # Gets the global application data.  This can be anything the
    # application wants.  If you pass +keys+, only return data
    # corresponding to the passed keys.
    def get_appdata_global (*keys)
      @restv1.get_global_appdata(*keys)
    end
  
  #Sets the global application data.This can be anything that application wants
    def add_appdata_global (params = {})
      @restv1.set_global_appdata(params = {})
    end
  
  
#
#  Real Time Stream
#        Resource:     http://api.myspace.com/stream/subscription? 
#        Description: Add Subscription
#        Subscription Usage : addSubscriptionV9('All','http://myspace.mycompany.com/handler.ashx','{}','',1,1);                                  
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
 def  add_subscription(type, endpoint, query, metadata, batchsize, rate, format, addlist, removelist)
   @realstream.add_subscription(type, endpoint, query, metadata, batchsize, rate, format, addlist, removelist)
 end
 
#  Real Time Stream
#        Resource:     http://api.myspace.com/stream/subscription/{subscriptionId}? 
#        Description: Update subscription
#        Update Subscription Usage : updateSubscriptionV9('1234', 'All','http://myspace.mycompany.com/handler.ashx','{}','',1,1);                                  
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
   def  update_subscription(subscription_id,type, endpoint, query, metadata, batchsize, rate, format, addlist, removelist)
     @realstream.update_subscription(subscription_id,type, endpoint, query, metadata, batchsize, rate, format, addlist, removelist)
   end
 
# Real Time Stream
#        Resource:      http://api.myspace.com/stream/subscription/{subscriptionId}? 
#        Description: Delete Subscription
#        Parameter:  subcription_id (mandatory) id of subscrption which user want to delete                                  
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
 def delete_subscription(subscription_id)
   @realstream.delete_subscription(subscription_id)
 end
 
#  Real Time Stream
#        Resource:      http://api.myspace.com/stream/subscription/{subscriptionId}? 
#        Description: Get Subscption 
#        Parameter:  subcription_id (mandatory) id of subscrption which user want to Get                                  
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
 def get_subscription (subscription_id)
   @realstream.get_subscription(subscription_id)
 end
 
# Real Time Stream
#        Resource:   http://api.myspace.com/stream/subscription/{all}? 
#        Description:Delete all Subscription                                       
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
#   
   def delete_allsubscription()
     @realstream.delete_allsubscription()  
   end
  
  
#  Real Time Stream
#        Resource:   http://api.myspace.com/stream/subscription/{subscriptionId}? 
#        Description:Get all Subscption                                         
#        Details:    http://wiki.developer.myspace.com/index.php?title=Category:Real_Time_Stream
  def get_allsubscription()
    @realstream.get_allsubscription()
  end
end

end
