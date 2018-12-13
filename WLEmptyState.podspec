#
# Be sure to run `pod lib lint WLEmptyState.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WLEmptyState'
  s.version          = '0.1.0'
  s.summary          = 'A short description of WLEmptyState.'

  s.description      = 'Empty State View'

  s.homepage         = 'https://github.com/lojals/WLEmptyState'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lojals' => 'jorge.ovalle@wizeline.com' }
  s.source           = { :git => 'https://github.com/wizeline/WLEmptyState.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'WLEmptyState/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WLEmptyState' => ['WLEmptyState/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
