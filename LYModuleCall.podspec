#
# Be sure to run `pod lib lint LYModuleCall.podspec' to ensure this.
#

Pod::Spec.new do |s|
  s.name             = 'LYModuleCall'
  s.version          = '0.1.0'
  s.summary          = 'LYModuleCall.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/blodely/LYModuleCall'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rick L' => 'indie.luo@gmail.com' }
  s.source           = { :git => 'https://github.com/blodely/LYModuleCall.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '11.0'

  s.source_files = 'LYModuleCall/Classes/**/*'
  
  s.resource_bundles = {
#   'LYModuleCall' => ['LYModuleCall/Assets/*.png']
    'LYModuleCall' => ['LYModuleCall/Assets/*.xcassets']
  }
# s.resources = 'LYModuleCall/Assets/*.xcassets'

  # s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'UIKit', 'AVFoundation'
  
  s.dependency 'LYCategory'
  
  s.dependency 'AgoraRtcEngine_iOS', '~> 3.6.0'
	
end
