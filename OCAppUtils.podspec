Pod::Spec.new do |spec|

  spec.name         = "OCAppUtils"
  spec.version      = "1.0.0"
  spec.summary      = "OC Tools"
  spec.description  = <<-DESC
                      Extensions, base classes, tools commonly used in iOS development
                      DESC
  spec.homepage     = "https://github.com/LqDeveloper/OCAppUtils"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Quan Li" => "q1083099465@qq,com" }
  spec.platform     = :ios
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/LqDeveloper/OCAppUtils.git", :tag => "1.0.0" }
  spec.requires_arc = true
  spec.default_subspec = 'Core'
  spec.subspec 'Core' do |sub|
    sub.source_files  = "OCAppUtils/Core/**/*.{h,m}"
    sub.frameworks  = "Foundation","UIKit","WebKit","Security"
  end

  # spec.subspec 'MVVM' do |sub|
  #   sub.source_files  = "OCAppUtils/MVVM/**/*.{h,m}"
  #   sub.dependency  = 'OCAppUtils/Core'
  #   sub.frameworks  = "Foundation","UIKit","WebKit","Security"
  # end
end
