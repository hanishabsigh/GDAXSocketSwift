Pod::Spec.new do |s|
  s.name             = 'GDAXSocketSwift'
  s.version          = '0.1.3'
  s.summary          = 'Unofficial Swift implementation of GDAX WebSocket API.'
  s.description      = 'Unofficial Swift implementation of GDAX Websocket API.'
  s.homepage         = 'https://github.com/hanishabsigh/GDAXSocketSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hani Shabsigh' => 'hani@neuecoin.com' }
  s.source           = { :git => 'https://github.com/hanishabsigh/GDAXSocketSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hanishabsigh'
  s.ios.deployment_target = '8.1'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '4.0'
  s.source_files = 'GDAXSocketSwift/Classes/**/*'
  s.dependency 'CryptoSwift'
  s.swift_version = '4.2'
  s.deprecated_in_favor_of = 'CoinbaseSocketSwift'
end
