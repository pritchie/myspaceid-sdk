module MySpace
  class RestV9
    @context =nil
    def initialize(myspaceContext)
        @context=myspaceContext
    end
    
    
    #http://opensocial.myspace.com/roa/09/albums
    EndPoint.define(:albums_v9_album_fields,'http://opensocial.myspace.com/roa/09/albums/@supportedFields',           :get,    :v1_json)
    EndPoint.define(:albums_v9_get,'http://opensocial.myspace.com/roa/09/albums/{person_id}/@self',                   :get,    :v1_json)
    EndPoint.define(:album_v9_get,'http://opensocial.myspace.com/roa/09/albums/{person_id}/@self/{album_id}',                   :get,    :v1_json)
    EndPoint.define(:albums_v9_put,'http://opensocial.myspace.com/roa/09/albums/{person_id}/@self/',:put, :v1_json)
    EndPoint.define(:albums_v9_update_put,'http://opensocial.myspace.com/roa/09/albums/{person_id}/@self/{album_id}',                    :put, :v1_json)
    #Media Items
    EndPoint.define(:mediaItems_v9_fields,'http://opensocial.myspace.com/roa/09/mediaItems/@supportedFields',           :get,    :v1_json)
    EndPoint.define(:mediaItems_v9_fields,'http://opensocial.myspace.com/roa/09/mediaItems/@supportedFields',           :get,    :v1_json)
    EndPoint.define(:mediaItems_v9_Get,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/@self/{album_id}',:get,    :v1_json)
    EndPoint.define(:mediaItems_v9_PhotoItem_Get,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/@self/{album_id}/{mediaItem_id}',:get,    :v1_json)
   
   
    #notifications
    EndPoint.define(:notification_v9_post,'http://opensocial.myspace.com/roa/09/notifications/@me/@self',:post)
    #photos
    EndPoint.define(:mediaItem_v9_add,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/@self/{album_id}',:post)
    EndPoint.define(:mdeiaItem_v9_update,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/{selector}/{album_id}/{mediaItem_Id}?xoauth_requestor_id={user_id}',:post)
    EndPoint.define(:videos_v9_get,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/{selector}/@videos',:get,:v1_json)
    EndPoint.define(:videos_v9_Item_get,'http://opensocial.myspace.com/roa/09/mediaItems/{person_id}/{selector}/@videos/{mediaItem_Id}',:get,:v1_json)
    EndPoint.define(:videos_v9_supportedcategories,'http://opensocial.myspace.com/roa/09/mediaitems/{person_id}/@videos/@supportedcategories',:get,:v1_json)
    EndPoint.define(:videos_v9_category,'http://opensocial.myspace.com/roa/09/mediaitems/{person_id}/@videos/@supportedcategories/{category_id}',:get,:v1_json)
    #MediaItemComments
    EndPoint.define(:MediaItem_v9_Comments,'http://opensocial.myspace.com/roa/09/mediaitemcomments/{person_id}/@self/{album_id}/{mediaItem_id}',:get,:v1_json)
    #Activities
    #http://opensocial.myspace.com/roa/09/activities/@supportedFields
    EndPoint.define(:activities_v9_supportedfields,'http://opensocial.myspace.com/roa/09/activities/@supportedFields',:get,:v1_json)
    EndPoint.define(:activities_v9_supportedverbs,'http://opensocial.myspace.com/roa/09/activities/@supportedVerbs',:get,:v1_json)  
    EndPoint.define(:activities_v9_supportedobjecttypes,'http://opensocial.myspace.com/roa/09/activities/@supportedObjectTypes',:get,:v1_json)
    EndPoint.define(:activities_v9_get,'http://opensocial.myspace.com/roa/09/activities/{person_id}/{selector}',:get,:v1_json)
    EndPoint.define(:activities_v9_app_get,'http://opensocial.myspace.com/roa/09/activities/{person_id}/{selector}/{appId}',:get,:v1_json)
    EndPoint.define(:activities_v9_app_post,'http://opensocial.myspace.com/roa/09/activities/{person_id}/@self',:post,:v1_json)
    
    
    #App Data
    EndPoint.define(:appdata_v9_user_put,'http://opensocial.myspace.com/roa/09/appData/{person_id}/@self/{appId}',                  :post)
    EndPoint.define(:appdata_v9_user_getAll,'http://opensocial.myspace.com/roa/09/appData/{person_id}/{selector}/{appId}',                  :get)
    EndPoint.define(:appdata_v9_user_getSingle,'http://opensocial.myspace.com/roa/09/appData/{person_id}/{selector}/{appId}?fields={field}',                  :get)
    EndPoint.define(:appdata_v9_user_delete,'http://opensocial.myspace.com/roa/09/appData/{person_id}/@self/{appId}?fields={field}',                  :delete)
    #Profile Comments
    EndPoint.define(:profilecomments_v9_user_get,'http://opensocial.myspace.com/roa/09/profilecomments/{person_id}/@self',                  :get)
    #moods
    EndPoint.define(:mood_supported_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@supportedMood',                  :get)
    EndPoint.define(:mood_supported_byId_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@supportedMood/{moodId}',                  :get)
    EndPoint.define(:mood_comments_v9_get,'http://opensocial.myspace.com/roa/09/statusmoodcomments/{person_id}/@self',                  :get)
    EndPoint.define(:mood_comments_v9_post,'http://opensocial.myspace.com/roa/09/statusmoodcomments/{person_id}/@self',                  :post)
    
    
    EndPoint.define(:mood_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@self',                  :get)
    EndPoint.define(:mood_Friends_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@friends',                  :get)
    EndPoint.define(:mood_Friends_history_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@friends/history',                  :get)
    EndPoint.define(:mood_byFriendid_History_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/{selector}/{friend_id}/history',                  :get)
    EndPoint.define(:mood_Friends_by_friendid_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@friends/{friend_id}',                  :get)
    EndPoint.define(:mood_history_v9_get,'http://opensocial.myspace.com/roa/09/statusmood/{person_id}/@self/history',                  :get)
    EndPoint.define(:status_update_v9,'http://opensocial.myspace.com/roa/09/statusmood/@me/@self',                  :put)
    
    
    #people
    EndPoint.define(:people_v9_supportedfields,'http://opensocial.myspace.com/roa/09/people/@supportedFields',                  :get)
    EndPoint.define(:people_v9_get,'http://opensocial.myspace.com/roa/09/people/{person_id}/{selector}',                  :get)
    EndPoint.define(:people_friend_v9_get,'http://opensocial.myspace.com/roa/09/people/{person_id}/@me/{friend_id}',                  :get)
    #groups
    EndPoint.define(:groups_v9_supportedfields,'http://opensocial.myspace.com/roa/09/groups/@supportedFields',                  :get)
    EndPoint.define(:groups_v9_get,'http://opensocial.myspace.com/roa/09/groups/{person_id}',                  :get)
    
    
    
      #Returns all the album fields that are supported
    def get_album_fields()        
      @context.call_myspace_api(:albums_v9_album_fields)
    end
    
    #Gets the albums data
    # {"entry":[
    #  {"album": 
    #    {"caption":"Test Security",
    #     "id":"myspace.com.album.1224563",
    #     "thumbnailUrl":"http:\/\/c2.ac-images.myspacecdn.com\/images02\/16\/m_46e99190a67b4cedaecc4d9889c8ea25.jpg"
    #    }
    #  }],
    #  "itemsPerPage":1,
    #  "startIndex":1,
    #  "totalResults":2}
    def get_albums(person_id,params)
      person_id= person_id.to_s
      @context.validate_identifier(:person_id, person_id)
      @context.call_myspace_api(:albums_v9_get,params.dup.update(:person_id=>person_id))
    end
   
   def get_album_by_id(person_id,album_id,fields='')
      person_id= person_id.to_s
      @context.validate_identifier(:person_id, person_id)
      @context.validate_identifier(:album_id, album_id)
      @context.call_myspace_api(:album_v9_get,:person_id =>person_id,:album_id=>album_id)
    end
   
   
   
    def create_albumv9(person_id, caption, location, privacy)
        valid_privacy_values = ['Everyone', 'FriendsOnly', 'Me']
        if valid_privacy_values.include?(privacy)
        else
          raise BadIdentifier.new('privacy', privacy)
        end
       body= '{ "caption": "' + caption + '",  "mediaItemCount":0 ,"msPrivacyLevel" : "' + privacy + '","location" : "' + location + '"}'
       @context.call_myspace_api(:albums_v9_put,:person_id=>person_id,:body=> body)
    end
    
    def update_album(person_id,album_id, caption, location, privacy)
        valid_privacy_values = ['Everyone', 'FriendsOnly', 'Me']
        if valid_privacy_values.include?(privacy)
        else
          raise BadIdentifier.new('privacy', privacy)
        end
    
       body= '{ "caption": "' + caption + '",  "mediaItemCount":0 ,"msPrivacyLevel" : "' + privacy + '","location" : "' + location + '"}'
       
      @context.call_myspace_api(:albums_v9_update_put,:person_id=>person_id,:album_id=>album_id,:body=>body)
    end
    
     def get_mediaItems_fields()        
      @context.call_myspace_api(:mediaItems_v9_fields)
    end
    def get_mediaItems(person_id, album_id, params={})
       @context.validate_identifier(:person_id, person_id)
       @context.validate_identifier(album_id, album_id)
       @context.call_myspace_api(:mediaItems_v9_Get, params.dup.update( :person_id=>person_id,:album_id=>album_id))
    end
    
    def get_mediaitems_by_mediaid(person_id,album_id, media_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.validate_identifier(:album_id, album_id)
       @context.call_myspace_api(:mediaItems_v9_PhotoItem_Get,params.dup.update(:person_id=>person_id,:album_id=>album_id,:mediaItem_id => media_id))
    end
    
    def add_photo(person_id,caption,album_id,data)
        header= {'Content-Type'=>'image/jpeg'}
        @context.call_myspace_api(:mediaItem_v9_add,:person_id=>person_id,:album_id=>album_id,:type => "IMAGE",:caption=>caption,:body=>data,:headers=>header)
    end
    
    def add_video(person_id,album_id,caption,description,tags,language,data,mscategories,contentType,params={})
         ct={'Content-Type'=>contentType}
         @context.call_myspace_api(:mediaItem_v9_add,params.dup.update(:person_id=>person_id,:headers=>ct,:album_id=>album_id,:type => "VIDEO",:caption=>caption,:body=>data,:mscategories=>mscategories,:language=>language,:tags=>tags,:description=>description))
    end
    def update_photov9(user_id,person_id,album_id,selector,item_Id,title,params = {})
       deletes = MySpace.remove_null_values(params)
       @context.call_myspace_api(:mdeiaItem_v9_update,:person_id=>person_id,:album_id=>album_id,:selector=>selector,:user_id=>user_id,:mediaItem_id=>item_Id,:body=>{:title=>title})
    end
    
    def update_video(user_id,person_id,album_id,selector,item_Id,title,params = {})
       deletes = MySpace.remove_null_values(params)
       @context.call_myspace_api(:mdeiaItem_v9_update,:person_id=>person_id,:album_id=>album_id,:selector=>selector,:user_id=>user_id,:mediaItem_id=>item_Id,:body=>{:title=>title})
    end

    
    def get_videosv9(person_id,selector,params = {})
       deletes = MySpace.remove_null_values(params)
       @context.validate_identifier(:person_id, person_id)
       @context.validate_identifier(:selector, selector)
       @context.call_myspace_api(:videos_v9_get,:person_id=>person_id,:selector=>selector)
    end
    def get_mediaItemsv9_videos_Item(person_id,selector,item_Id,params = {})
       @context.validate_identifier(:person_id, person_id)
       @context.validate_identifier(:selector, selector)
       deletes = MySpace.remove_null_values(params)
       @context.call_myspace_api(:videos_v9_Item_get,:person_id=>person_id,:selector=>selector,:mediaItem_id => item_Id)
    end
    
    def get_video_supportedcategories( person_id, startindex='', count='')
      @context.validate_identifier(:person_id, person_id)
      @context.call_myspace_api(:videos_v9_supportedcategories,:person_id=> person_id, :startindex=>startindex, :count=>count)# ,:selector=>'@self',album_id=>'myspace.com.album.1142374',user_Id)
    end
    def get_video_supportedcategories_by_Id(person_id,category_Id)
        @context.call_myspace_api(:videos_v9_category,:person_id=>person_id,:category_id=>category_Id)# ,:selector=>'@self',album_id=>'myspace.com.album.1142374',user_Id)
    end
    
    
    def get_mediaItem_comments(person_id, album_id, media_id)
       @context.call_myspace_api(:MediaItem_v9_Comments,:person_id=>person_id,:album_id=>album_id,:mediaItem_id => media_id)
    end
    
    def get_activites_supportedfields()
       @context.call_myspace_api(:activities_v9_supportedfields)
    end
    
    def get_activites_supportedverbs()
       @context.call_myspace_api(:activities_v9_supportedverbs)
    end
    
    def get_activites_supportedobjecttypes()
       @context.call_myspace_api(:activities_v9_supportedobjecttypes)
    end
    
    
    def get_activitesv9(person_id,selector,params={})
         @context.validate_identifier(:person_id, person_id)
         @context.call_myspace_api(:activities_v9_get,params.dup.update(:person_id=>person_id,:selector=>selector))
    end
    
    def get_activites_by_appid(person_id,app_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:activities_v9_app_get,params.dup.update(:person_id=>person_id,:appId=>appId))
    end

    def add_activites(person_id,externalId,title,msgBody,templateParams,titleId)
        body ='{
                  "externalId":"'+externalId+'",
                  "id":"myspace.com.activity.-1",
                  "title":"'+title+'",
                  "body":"'+msgBody+'",
                  "templateParams":'+templateParams.to_json+',
                  "titleId":"'+titleId+'"
              }'
       @context.call_myspace_api(:activities_v9_app_post,:person_id=>person_id,:body=>body)
    end
    
    
    
    def add_appdata(person_id,appId,key,value)
       @context.validate_identifier(:person_id, person_id)
       body ='{"userId":'+person_id+',
              "appData":[{"key":"'+key+'","value":"'+value+'"}]}'
       @context.call_myspace_api(:appdata_v9_user_put,:person_id=>person_id,:appId=>appId,:fields=>key,:body=>body)
    end
    
    def update_appdata(person_id,appId,key,value)
       @context.validate_identifier(:person_id, person_id)
       body ='{"userId":'+person_id+',
              "appData":[{"key":"'+key+'","value":"'+value+'"}]}'
       @context.call_myspace_api(:appdata_v9_user_put,:person_id=>person_id,:selector=>selector,:appId=>appId,:fields=>key,:body=>body)
    end
    
   def get_appdata(person_id,selector,appId,field)
       @context.call_myspace_api(:appdata_v9_user_getSingle,:person_id=>person_id,:selector=>selector,:appId=>appId,:field=>field)
   end

   def delete_appdata(person_id,appId,field)
        @context.validate_identifier(:person_id, person_id)
        @context.call_myspace_api(:appdata_v9_user_delete,:person_id=>person_id,:appId=>appId,:field=>field)
   end
   def get_profile_comments(person_id,params={})
        @context.validate_identifier(:person_id, person_id)
        @context.call_myspace_api(:profilecomments_v9_user_get, params.dup.update(:person_id=>person_id))
   end
   def get_statusmood_comments(person_id,status_id)
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_comments_v9_get,:person_id=>person_id,:statusId=>status_id)
   end

   
      def add_statusmoodcomment(person_id,status_id,body)
       @context.validate_identifier(:person_id, person_id)
        body='{"body":"'+body+'"}'
        @context.call_myspace_api(:mood_comments_v9_post,:person_id=>person_id,:statusId=>status_id,:body=>body)
   end
   

   def get_mood_supported(person_id)
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_supported_v9_get,:person_id=>person_id)
   end
   
   def get_mood_supported_by_moodId(person_id,moodId)
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_supported_byId_v9_get,:person_id=>person_id,:moodId=>moodId)
   end

   def get_statusmood(person_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_v9_get,params.dup.update(:person_id=>person_id))
   end


   def get_friends_statusmood(person_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_Friends_v9_get,params.dup.update(:person_id=>person_id))
   end
   
  def  get_self_statusmood_history(person_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_history_v9_get,params.dup.update(:person_id=>person_id))
  end
       
       
       
  def  get_friends_statusmood_history(person_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:mood_Friends_history_v9_get,params.dup.update(:person_id=>person_id))
  end
    
  def get_friends_statusmood_by_friendid(person_id,friend_id,params={})
      @context.validate_identifier(:person_id, person_id)
      @context.call_myspace_api(:mood_Friends_by_friendid_v9_get,params.dup.update(:person_id=>person_id,:friend_id=>friend_id))
  end
    
  def get_friends_statusmood_history_by_friendid(person_id,friend_id,params={})
    @context.validate_identifier(:person_id, person_id)
    @context.call_myspace_api(:mood_byFriendid_History_v9_get,:person_id=>person_id,:selector=>selector,:friend_id=>friend_Id,:history=>history,:params=>params)
  end    
 
 
  def set_status(person_id,latitude,longitude,moodName,status)
  @context.validate_identifier(:person_id, person_id)   
  body ='{
            "currentLocation":{
                "latitude":"'+latitude+'",
                "longitude":"'+longitude+'"
            },
            "moodName":"'+moodName+'",
            "status":"'+status+'"
        }'
       @context.call_myspace_api(:status_update_v9,:body=>body)
   end
  
  
  def get_people_supportedfileds()
        @context.call_myspace_api(:people_v9_supportedfields)
        
   end
  
  
   def get_person(person_id,params={})
        @context.validate_identifier(:person_id, person_id)
        @context.call_myspace_api(:people_v9_get,params.dup.update(:person_id=>person_id))
   end
      
   def get_people_by_friendId(person_id,friend_Id,params={})
      @context.validate_identifier(:person_id, person_id)
      @context.call_myspace_api(:people_friend_v9_get,params.dup.update(:person_id=>person_id,:friend_id=>friend_Id))
   end
   
  
   def get_groups_supportedFields()
       @context.call_myspace_api(:groups_v9_supportedfields)
   end
   
   def get_groups(person_id,params={})
       @context.validate_identifier(:person_id, person_id)
       @context.call_myspace_api(:groups_v9_get,params.dup.update(:person_id=>person_id))
   end
   
 
 
  def get_notificationsv9(person_id,user_id)
       @context.validate_identifier(:user_Id, user_id)
       @context.call_myspace_api(:notification_v9_get,:user_id=>user_id)
   end
   
  def send_notificationsv9(msMediaItemUri,recipientIds,canvasUrl,content)
       
       body ='{
                "mediaItems":[{"msMediaItemUri":"'+msMediaItemUri+'"}],
                "recipientIds":["'+recipientIds+'"],
                "templateParameters":[{"key":"canvasUrl+","value":"'+canvasUrl+'"},{"key":"content","value":"'+content+'"}]
              }'
      @context.call_myspace_api(:notification_v9_post,:body=>body)
   end
end
end