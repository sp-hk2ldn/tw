platform :ios, '13.0'

target 'tw' do
  use_frameworks!
  pod 'SwiftLint'
  pod 'RealmSwift', '=10.1.4'

  target 'twTests' do
    inherit! :search_paths
    pod 'Nimble'
    pod 'Quick'
    pod 'RealmSwift', '=10.1.4'
  end

  target 'twUITests' do
  end
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
end
