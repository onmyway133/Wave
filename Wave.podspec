Pod::Spec.new do |s|
  s.name             = "Wave"
  s.summary          = "Animation in Swift"
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/onmyway133/Wave"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Wave.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.ios.source_files = 'Sources/**/*'
  s.tvos.source_files = 'Sources/**/*'

  s.ios.frameworks = 'UIKit', 'Foundation'
end
