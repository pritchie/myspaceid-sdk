module MySpace
  class OpenSearch

    def initialize(myspaceContext)
        @context=myspaceContext
    end
    #open search
    
    EndPoint.define(:search_images,'http://api.myspace.com/opensearch/images',                  :get)
    EndPoint.define(:search_videos,'http://api.myspace.com/opensearch/videos',                  :get)
    EndPoint.define(:search_people,'http://api.myspace.com/opensearch/people',                  :get)
    
   def search_images(searchTerms,params={})
       @context.call_myspace_api(:search_images, params.update({:searchTerms=>searchTerms,:format=>'json'}))
   end
   def search_videos(searchTerms,params={})
       @context.call_myspace_api(:search_videos, params.update({:searchTerms=>searchTerms,:format=>'json'}))
   end
   
   def search_people(searchTerms,params={})
       @context.call_myspace_api(:search_people, params.update({:searchTerms=>searchTerms,:format=>'json'}))
   end
   
  end
end