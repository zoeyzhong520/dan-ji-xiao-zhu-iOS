source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'dan-ji-xiao-zhu-iOS' do
  pod 'Kingfisher'
  pod 'SnapKit', '~> 5.6.0'
  pod 'SwiftyFitsize'
end

#修复Xcode 13 Archive Error
post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
    end
end
