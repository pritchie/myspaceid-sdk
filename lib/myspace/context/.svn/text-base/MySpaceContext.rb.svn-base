module MySpace
  class MySpaceContext
    APPLICATION_TYPE_ONSITE     = 'onsite'      unless const_defined?('APPLICATION_TYPE_ONSITE')
    APPLICATION_TYPE_OFFSITE    = 'offsite'     unless const_defined?('APPLICATION_TYPE_OFFSITE')

    OAUTH_SITES = {
      :prod => 'http://api.myspace.com',
      :stage => 'http://stage-api.myspace.com',
#      :prod => '',
#      :stage => '',
    } unless const_defined?('OAUTH_SITES')
    
    OAUTH_REQUEST_TOKEN_URL = '/request_token'  unless const_defined?('OAUTH_REQUEST_TOKEN_URL')
    OAUTH_AUTHORIZATION_URL = '/authorize'      unless const_defined?('OAUTH_AUTHORIZATION_URL')
    OAUTH_ACCESS_TOKEN_URL  = '/access_token'   unless const_defined?('OAUTH_ACCESS_TOKEN_URL')

    # tests regularly timeout at 2 seconds
    TIMEOUT_SECS = 123213213213 unless const_defined?('TIMEOUT_SECS')
  
    
    attr_reader :consumer
    attr_accessor :http_logger
    attr_accessor :request_token
    attr_accessor :access_token
  
     
    
    
    # Save the application key/secret(s) and initialize OAuth code.
    #
    # If optional param +:application_type+ is passed, it must be one
    # of +MySpace::APPLICATION_TYPE_ONSITE+ or
    # +MySpace::APPLICATION_TYPE_OFFSITE+.  If the application is an
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
      @http_logger = params[:logger]
      site = params[:site] || :prod
       @consumer = ::OAuth::Consumer.new(oauth_token_key,
                                        oauth_token_secret,
                                        :scheme => :query_string,
                                        # :scheme => :header,
                                        :http_method => :get,
                                        :site => OAUTH_SITES[site],
                                        :request_token_path => OAUTH_REQUEST_TOKEN_URL,
                                        :access_token_path => OAUTH_ACCESS_TOKEN_URL,
                                        :authorize_path => OAUTH_AUTHORIZATION_URL,
                                        :exclude_body_hash => true
                                        )

      if params[:application_type] == APPLICATION_TYPE_ONSITE
        @access_token = ::OAuth::AccessToken.new(@consumer, "", "")
      elsif params[:access_token]
        @access_token = ::OAuth::AccessToken.new(@consumer,
                                                 params[:access_token],
                                                 params[:access_token_secret])
      end
      if params[:request_token]
        @request_token = ::OAuth::RequestToken.new(@consumer,
                                                   params[:request_token],
                                                   params[:request_token_secret])
      end
     
     end


    # Get an unauthorized request token from MySpace.
    def get_request_token(oauth_callback)
      @consumer.get_request_token :oauth_callback => oauth_callback
    end

    # Get the url to which to redirect the user in order to authorize
    # our access to their account.  This url will redirect back to
    # +callback_url+ once the user authorizes us.
    def get_authorization_url(request_token, callback_url)
      "#{request_token.authorize_url}&oauth_callback=#{CGI::escape(callback_url)}"
    end

    # Get an access token once the user has authorized us.
    def get_access_token(request_token = @request_token,params={})
      # response = @consumer.token_request(@consumer.http_method,
      #                                    (@consumer.access_token_url? ? @consumer.access_token_url : @consumer.access_token_path),
      #                                    request_token,
      #                                    {},
      #                                    headers)

      # @access_token = ::OAuth::AccessToken.new(@consumer, response[:oauth_token], response[:oauth_token_secret])
      @access_token = request_token.get_access_token(params)
    end
    
    def call_myspace_api(name, params = {}, &block)
      params = params.dup
      ep = EndPoint.find(name)
      url = ep.compute_path(params)
      timeout = params.delete(:timeout) || TIMEOUT_SECS
      #body = ''
      
      body = params.delete(:body)
      headers = params.delete(:headers)
      
      params.delete(:v1_json)
      
      MySpaceContext.remove_empty_strings(params)
      query_str = params.collect do |key, value|
          CGI.escape(key.to_s) + '=' + CGI.escape(value.to_s) 
        end.join('&')
      

      url << '?' + query_str if query_str.length > 0

      resp = nil
      @http_logger.info("sending: '#{url}'") if @http_logger
      begin
        Timeout::timeout(timeout, TimeoutException) do
          resp = @access_token.request(ep.method, url, body, headers)
        end
      rescue TimeoutException => e
        e.timeout = timeout
        e.url = url
        raise e
      end
      @http_logger.info("received: '#{resp.code}': '#{resp.body}'") if @http_logger

      validate_response(resp, url)

      content_type = resp['content-type']
      if content_type
        if content_type =~ /json/
          return JSON::parse(resp.body)
        elsif content_type =~ /xml/
          return REXML::Document.new(resp.body)
        end
        
        raise "unknown content type: #{content_type}"
      end
    end
    
    def validate_response(response, url)
      code = response.code
      case code
      when '200'
        return
      when '201'
        return
      when '401'
        raise PermissionDenied.new(code, response.message, url)
      else
        raise RestException.new(code, response.message, url) unless ['200', '201'].include?(code)
      end
    end

    def self.remove_null_values(hash)
      hash.keys.inject([]) do |nulls, key|
        unless hash[key]
          hash.delete(key)
          nulls << key
        end
        nulls
      end
    end
    
    def self.remove_empty_strings(hash)
      hash.each do |key, value|
        if value.empty?
              hash.delete(key)
        end
     end
    end
    
   

    def self.appdata_to_hash(appdata = {}, &block)
      appdata = yield if block_given?
      return {} unless appdata['keyvaluecollection']
      appdata['keyvaluecollection'].inject({}) do |hash, entry|
        hash.update(entry['key'].to_sym => entry['value'])
      end
    end

    ID_REGEXP = /[0-9]+/ unless const_defined?('ID_REGEXP')
    PERSON_ID_REGEXP =/@me|[0-9]/ unless const_defined?('PERSON_ID_REGEXP')
    ALBUM_ID_REGEXP =/myspace.com.album.[0-9]|[0-9]/ unless const_defined?('ALBUM_ID_REGEXP')
    SELECTOR =/@self|@friends/ unless const_defined?('SELECTOR')
    
    def validate_identifier(parameter, identifier)
      if parameter == :person_id
        raise BadIdentifier.new(parameter, identifier)  unless identifier && identifier =~ PERSON_ID_REGEXP
      else if parameter ==:album_id 
        raise BadIdentifier.new(parameter, identifier)  unless identifier && identifier =~ ALBUM_ID_REGEXP
      else if parameter ==:selector
        raise BadIdentifier.new(parameter, identifier)  unless identifier && identifier =~ SELECTOR
      else
        raise BadIdentifier.new(parameter, identifier) unless identifier && identifier =~ ID_REGEXP
      end
    end

    
  end
end



end
end
