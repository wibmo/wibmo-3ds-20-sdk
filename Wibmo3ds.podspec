#
# Be sure to run `pod lib lint Wibmo3ds.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Wibmo3ds'
  s.version          = '1.0.0'
  s.summary          = 'A EMVCO Certified 3-D Secure [2.1.0] SDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        The SDK is designed as per the specification of EMV 3-D Secure Protocol and Core Functions Specification version 2.1.0
                        You need an license from Wibmo Inc. to use the SDK in your apps.
                        Contact us @ ios@wibmo.com for obtaining license.
                        
                        Wibmo3ds is certified by EMVCO which can be found at
                        https://www.emvco.com/wp-content/uploads/approved_products/uploaded/loa/3DS_LOA_SDK_WIBM_020100_00128_23Apr19.pdf
    
                       DESC

  s.homepage         = 'https://www.wibmo.com'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Wibmo Inc' => 'ios@wibmo.com' }
  s.source           = { :git => 'https://github.com/wibmo/wibmo-3ds-20-sdk.git', :tag => s.version.to_s}
  s.ios.deployment_target = '10.0'
  s.source_files = 'Wibmo3ds/Classes/**/*'
  
  s.resource_bundles = {
     'Wibmo3ds' => ['Wibmo3ds/Assets/*.*']
  }
  
  s.frameworks = 'UIKit', 'MapKit', 'AdSupport', 'CoreLocation'
  
  s.dependency 'DeviceKit', '~> 2.0'
  s.dependency 'SwiftyRSA', '~> 1.5'
  s.dependency 'CryptoSwift', '~> 1.0'
  s.dependency 'Alamofire', '~> 4.8'
  s.dependency 'AlamofireImage', '~> 3.5'
  s.dependency 'PKHUD', '~> 5.2'
  s.dependency 'SwCrypt', '~> 5.1'
  
end