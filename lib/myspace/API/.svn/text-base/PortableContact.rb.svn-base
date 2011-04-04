module MySpace
  class PortableContact

    def initialize(myspaceContext)
        @context=myspaceContext
    end

    EndPoint.define(:poco_person_get,'http://api.myspace.com/v2/people/{person_id}/@self',                  :get)
    EndPoint.define(:poco_friends_get,'http://api.myspace.com/v2/people/{person_id}/@friends',                  :get)
    def get_poco_person(person_Id,params={})
      @context.call_myspace_api(:poco_person_get,params.dup.update(:person_id=>person_Id))
    end
    
    def get_poco_friends(person_Id,params={})
      @context.call_myspace_api(:poco_friends_get,params.dup.update(:person_id=>person_Id))
    end
   
  
  
  end
end