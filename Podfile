platform :ios, '13.0'

target 'qn' do
  use_frameworks!
  pod 'SwiftLint'

  target 'qnTests' do
    inherit! :search_paths
    pod 'Nimble'
    pod 'Quick'
  end

  target 'qnUITests' do
  end
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
end
