use_frameworks!
platform:ios, '8.0'
target "TestCart" do
pod 'Alamofire', '~> 3.4.1'
pod 'RxSwift', '~> 2.6.0'
pod 'RxCocoa', '~> 2.6.0'
pod 'YYKit', '~> 1.0.9'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3'
        end
    end
end
