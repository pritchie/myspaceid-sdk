= MySpaceID SDK

* http://myspaceid-sdk.rubyforge.org/

== DESCRIPTION:

MySpaceID lets your users log on using their MySpace account info,
after which their MySpaceID data becomes available; that is, your web
servers will be able to communicate with our web servers and request
user data.

This SDK project contains examples of the base API code necessary to
make signed requests against the MySpaceID REST API.

To use the MySpaceID API, you first need to register on the MySpace
Developer Site, create an app, and obtain a consumer key and
secret. Information about these procedures, and about MySpaceID in
general, is available at the MySpaceID Developer Wiki:

http://wiki.developer.myspace.com/index.php?title=Category:MySpaceID

The MySpaceID Ruby SDK enables you to work with MySpace data using the
OpenStack (OpenID, OAuth etc) and the MySpace REST APIs via
easy-to-use high level interfaces.

The best way to implement your own application is to take an existing
sample and customize it.  Working Examples in this SDK:

    * OAuth - make signed requests
    * OpenID + OAuth Hybrid - delegated login, and making signed requests 

Documentation

    * Ruby SDK Documentation Summary: samples/rails/README
    * Ruby SDK - API Documentation: http://myspaceid-ruby-sdk.googlecode.com/svn/trunk/doc/index.html

Oauth gem Installation.
	We have made some modification in the Oauth library inorder to make the posts work.
goto your installed oauth library path
for example if you have installed ruby in c drive then goto this path
"C:\ruby\lib\ruby\gems\1.8\gems\oauth-0.4.0\lib\oauth\signature"
locate a file named base.rb and find a method "body_hash" as below

 def body_hash
      if self.class.hash_class
	Base64.encode64(self.class.hash_class.digest(request.body || '')).chomp.gsub(/\n/,'')
      else
        nil # no body hash algorithm defined, so don't generate one
      end
    end


in this method we need to return nil ALWAYS.so we copy and paste original method with the one given below

 def body_hash
      if self.class.hash_class
	  nil
      else
        nil # no body hash algorithm defined, so don't generate one
      end
    end

After making this change all the POSTs will work fine
== LICENSE:

MIT/X Consortium
