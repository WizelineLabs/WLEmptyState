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
  s.summary          = 'Custom view for Empty states on tables'

  s.description      = 'A control to display a place holder in case there\'s no data on a UITableView'

  s.homepage         = 'https://github.com/wizeline/WLEmptyState'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lojals' => 'jorge.ovalle@wizeline.com' }
  s.source           = { :git => 'https://github.com/wizeline/WLEmptyState.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.source_files = 'WLEmptyState/Classes/**/*'

  s.resource_bundles = {
      'WLEmptyState' => ['WLEmptyState/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
