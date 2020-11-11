Pod::Spec.new do |s|
  s.name             = 'WLEmptyState'
  s.version          = '3.1.0'
  s.summary          = 'Custom view for Empty states on tables or collection entities'

  s.description      = 'A control to display a place holder in case there\'s no data on a UITableView or UICollectionView'
  s.homepage         = 'https://github.com/wizeline/WLEmptyState'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wizeline iOS Team' => 'ios.open@wizeline.com' }
  s.source           = { :git => 'https://github.com/wizeline/WLEmptyState.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.swift_version    = '5.0'
  s.source_files = 'Sources/WLEmptyState/Classes/**/*'

  s.resource_bundles = {
      'WLEmptyState' => ['Sources/WLEmptyState/Assets/Assets.xcassets']
  }
end
