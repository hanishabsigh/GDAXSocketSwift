Pod::Spec.new do |s|
  s.name             = 'GDAXSocketSwift'
  s.version          = '0.1.0'
  s.summary          = 'Unofficial Swift implementation of GDAX WebSocket API.'
  s.description      = 'Unofficial Swift implementation of GDAX Websocket API.'
  s.homepage         = 'https://www.google.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hani Shabsigh' => 'hani@neuecoin.com' }
  s.source           = { :git => '~/git/GDAXSocketSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hanishabsigh'
  s.ios.deployment_target = '8.1'
  s.source_files = 'GDAXSocketSwift/Classes/**/*'
  s.dependency 'CryptoSwift'
end
