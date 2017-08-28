Pod::Spec.new do |s|

  s.name         = "FTInteractiveTransition"
  s.version      = "0.0.2"
  s.summary      = "FTInteractiveTransition, just a viewController transition."
  s.description  = <<-DESC
          It's just a viewController transition that I wrote for future projects.
                   DESC
  s.author             = { "liufengting" => "wo157121900@me.com" }
  s.homepage     = "https://github.com/liufengting/FTIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url   = "https://twitter.com/liufengting"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liufengting/FTInteractiveTransition.git", :tag => "#{s.version}" }
  s.source_files  = "FTInteractiveTransition", "FTInteractiveTransition/*.{h,m}"
  s.requires_arc = true

end
