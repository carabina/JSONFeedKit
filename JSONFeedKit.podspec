Pod::Spec.new do |s|
  url                     = "https://github.com/roonieone/JSONFeedKit"
  source_url              = "#{url}.git"
  s.name         = "JSONFeedKit"
  s.version      = "0.1.1"
  s.summary      = "A JSON Feed wrapper written in pure Swift."
  s.homepage     = url
  s.license      = { type: "MIT", file: "LICENSE" }
  s.author             = { "Mark Malstrom" => "malstrommark@gmail.com" }
  s.social_media_url   = "http://twitter.com/markmalstrom"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "10.0"
  s.source       = { git: source_url, tag: s.version }
  s.framework             = "Foundation"
  s.source_files  = "Sources"
  s.dependency "SimpleJSONKit"
end