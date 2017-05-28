#
#  Be sure to run `pod spec lint JSONFeedParser.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "JSONFeedParser"
  s.version      = "0.1.0"
  s.summary      = "A JSON Feed API wrapper written in pure Swift."
  s.description  = "A JSON Feed API wrapper, used to create model objects, written in pure Swift."
  s.homepage     = "http://EXAMPLE/JSONFeedParser"
  s.license      = "MIT"
  s.author             = { "Mark Malstrom" => "malstrommark@gmail.com" }
  s.social_media_url   = "http://twitter.com/Mark Malstrom"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "10.0"
  s.source       = { :git => "http://EXAMPLE/JSONFeedParser.git", :tag => "#{s.version}" }
  s.source_files  = "Sources"
  s.dependency 'JSON-Swift'
end
