#
# Be sure to run `pod lib lint SharedNetworkActivityIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SharedNetworkActivityIndicator'
  s.version          = '0.1.1'
  s.summary          = 'Provide to ability to share Network Activiy Indicator by many objects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SharedNetworkActivityIndicator provide you to ability to share Network Activiy Indicator by many objects.

A NSObject.sna_networkActivityIndicatorVisible property is key concept of
this library.
If you set YES to NSObject.sna_networkActivityIndicatorVisible;
it will changed to invisible when you set NO to the property,
or the lifecycle of the object was end.
                       DESC

  s.homepage         = 'https://github.com/wagyu298/SharedNetworkActivityIndicator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wagyu298' => 'wagyu298@gmail.com' }
  s.source           = { :git => 'https://github.com/wagyu298/SharedNetworkActivityIndicator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wagyu298'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SharedNetworkActivityIndicator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SharedNetworkActivityIndicator' => ['SharedNetworkActivityIndicator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'LiveObjectTracer'
end
