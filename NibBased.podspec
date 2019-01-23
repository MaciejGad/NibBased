Pod::Spec.new do |s|
  s.name         = "NibBased"
  s.version      = "1.0"
  s.summary      = "A micro-framework that help to handle xib/nib based layout"
  s.description  = <<-DESC
  A micro-framework that help to handle xib/nib based layout. 
  If you prefer to avoid usage of storyboards in your project, 
  this few classes will help you organized your view related part of the code. 
  DESC
  
  s.homepage     = "https://github.com/MaciejGad/NibBased"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Maciej Gad" => "https://github.com/MaciejGad" }
  s.social_media_url   = "https://twitter.com/maciej_gad"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/MaciejGad/NibBased.git", :tag => 'v1.0' }
  s.source_files  =  "NibBased/*.swift"
  s.swift_version = '4.2'

end