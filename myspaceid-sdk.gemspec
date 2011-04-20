require 'rubygems'
require 'rake'

Gem::Specification.new do |s|
   s.name = %q{myspaceid-sdk}
   s.version = "0.1.12.1"
   s.date = %q{2011-04-04}
   s.authors = ["Patrick Ritchie"]
   s.email = %q{}
   s.require_paths = ["lib"]
   s.summary = %q{For of Official SDK for MySpaceID and MySpace Data Accessibility.}
   s.homepage = %q{http://developer.myspace.com/}
   s.has_rdoc = true
   s.description = %q{The MySpaceID SDK provides a library for implementing MySpaceID and accessing MySpace users account data.}
   s.files = FileList[
                      "README", "lib/**/*", "test/**/*", "samples/**/*"
                     ].exclude(/db\/cstore\/(associations|nonces)|log\//)
   s.rubyforge_project = %q{myspaceid-sdk}
   s.add_dependency('ruby-openid', '>= 2.1.8')
   s.add_dependency('oauth', '>= 0.4.4')
   s.add_dependency('json', '>= 1.4.6')
end
