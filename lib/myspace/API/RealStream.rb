module MySpace
  class RealStream

    def initialize(myspaceContext)
        @context=myspaceContext
    end

    EndPoint.define(:stream_subscription_post,'http://api.myspace.com/stream/subscription',                   :post)
    EndPoint.define(:stream_subscription_put,'http://api.myspace.com/stream/subscription/{subscription_id}',   :put)
    EndPoint.define(:stream_subscription_delete,'http://api.myspace.com/stream/subscription/{subscription_id}',   :delete)
    EndPoint.define(:stream_subscription_delete_all,'http://api.myspace.com/stream/subscription/@all',   :delete)
    EndPoint.define(:stream_subscription_get,'http://api.myspace.com/stream/subscription/{subscription_id}',   :get)
    EndPoint.define(:stream_subscription_get_all,'http://api.myspace.com/stream/subscription/@all',   :get)
    
    
    def add_subscription(type, endpoint, query, metadata, batchsize, rate, format, addlist='', removelist='')
       body = '{"Subscription" : 
       {"Type" :"' + type + '",
       "Endpoint" : "' + endpoint + '",
       "Query" :{' + query + '} ,
       "MetaData" : "' + metadata + '",
       "BatchSize" : ' + batchsize + ',
       "Rate" :' + rate + ',
       "Format" : "' + format + '",
       "UserList" : {"AddList" : [' + addlist + '],
       "RemoveList" :[' + removelist + ']}}}'
      @context.call_myspace_api(:stream_subscription_post,:body=>body)    
      
    end
    
     def update_subscription(subscription_id,type, endpoint, query, metadata, batchsize, rate, format, addlist, removelist)
       body = '{"Subscription" : 
       {
       "id" :"' + subscription_id+ '",
       "Type" :"' + type + '",
       "Endpoint" : "' + endpoint + '",
       "Query" :' + query + ' ,
       "MetaData" : "' + metadata + '",
       "BatchSize" : ' + batchsize + ',
       "Rate" :' + rate + ',
       "Format" : "' + format + '",
       "UserList" : {"AddList" : ' + addlist + ',
       "RemoveList" :' + removelist + '}}}'
      @context.call_myspace_api(:stream_subscription_post,:subscription_id=>subscription_id,:body=>body)    
      
    end
    
    def delete_subscription(subscription_id)
      @context.call_myspace_api(:stream_subscription_delete,:subscription_id=>subscription_id)
    end
   
   def get_subscription(subscription_id)
    @context.call_myspace_api(:stream_subscription_get,:subscription_id=>subscription_id)  
   end
   def get_allsubscription()
    @context.call_myspace_api(:stream_subscription_get_all)  
   end
  
   def delete_allsubscription()
     @context.call_myspace_api(:stream_subscription_delete_all)
   end
  
  end
end