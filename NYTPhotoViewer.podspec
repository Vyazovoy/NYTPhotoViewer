Pod::Spec.new do |s|
  s.name             = "NYTPhotoViewer"
  s.version          = "1.0.1-video"

  s.description      = <<-DESC
                       NYTPhotoViewer is a slideshow and image viewer that includes double tap to zoom, captions, support for multiple images, interactive flick to dismiss, animated zooming presentation, and more.
                       DESC
  s.summary          = "NYTPhotoViewer is a slideshow and image viewer that includes double tap to zoom, flick to dismiss, animated presentation, and more."

  s.homepage         = "https://github.com/NYTimes/NYTPhotoViewer"
  s.author           = "The New York Times"
  s.license          = { :type => 'Apache 2.0' }
  s.source           = { :git => "https://github.com/NYTimes/NYTPhotoViewer.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.subspec 'Core' do |ss|
    ss.ios.resource_bundle = { s.name => ['Pod/Assets/ios/*.png'] }
    ss.source_files = 'Pod/Classes/**/*'
    ss.frameworks = 'UIKit', 'Foundation', 'AVKit', 'AVFoundation'
  end

  s.subspec 'AnimatedGifSupport' do |ss|
    ss.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ANIMATED_GIF_SUPPORT=1'}

    ss.dependency 'NYTPhotoViewer/Core'
    ss.dependency 'FLAnimatedImage', '~> 1.0.8'
  end

end
