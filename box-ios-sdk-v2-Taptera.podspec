Pod::Spec.new do |s|
  # Root specification

  s.name                  = 'box-ios-sdk-v2-Taptera'
  s.version               = '1.2.2'
  s.summary               = 'iOS + OS X SDK for the Box V2 API.'
  s.homepage              = 'https://github.com/box/box-ios-sdk-v2'
  s.license               = { type: 'MIT', file: 'LICENSE' }
  s.author                = 'Ryan Lopopolo'
  s.source                = { git: 'https://github.com/taptera/deprecated-box-ios-sdk.git', tag: "v#{s.version}-taptera" }

  # Platform

  s.ios.deployment_target = '8.0'

  s.ios.header_dir        = "BoxSDK"

  # File patterns

  s.source_files        = 'BoxSDK/*.{h,m}', 'BoxSDK/**/*.{h,m}'
  s.exclude_files       = 'BoxSDK/External/ISO8601DateFormatter/BoxISO8601DateFormatter.{h,m}'

  # Build settings

  s.frameworks        = 'Security', 'QuartzCore'
  s.requires_arc          = true
  s.xcconfig              = { 'OTHER_LDFLAGS' => '-ObjC' }

  # Subspecs

  s.subspec 'no-arc' do |sp|
    sp.source_files              = 'BoxSDK/External/ISO8601DateFormatter/BoxISO8601DateFormatter.{h,m}'
    sp.requires_arc              = false
  end
end
