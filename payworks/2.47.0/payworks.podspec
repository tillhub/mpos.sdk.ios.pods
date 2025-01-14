Pod::Spec.new do |spec|
    spec.name               = 'payworks'
    spec.version            = '2.47.0'
    spec.license            = { :type => 'Copyright', :text => 'Copyright (c) 2021 CyberSource Corporation. All Rights Reserved.' }
    spec.homepage           = 'https://payworks.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
    spec.summary            = 'A delightful payment integration framework powered by payworks'
    spec.platform           = :ios, '10.0'
    spec.requires_arc       = true
    spec.source             = { :http => 'https://releases.payworks.io/artifactory/mpos-ios/io/payworks/mpos.ios.sdk/'+spec.version.to_s+'/mpos.ios.sdk-'+spec.version.to_s+'.zip' }
    spec.default_subspec       = 'default'

    spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    spec.subspec 'mpos' do |mpos|

        mpos.subspec 'core' do |core|
            core.vendored_frameworks    = 'mpos_core.framework', 'core.xcframework'
            core.frameworks             = 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration', 'UIKit', 'Foundation', 'CoreGraphics'
            core.library                = 'icucore'
        end
    end

    spec.subspec 'default' do |default|
        default.dependency 'payworks/mpos/core'
    end


    spec.subspec 'offline' do |offline|
        offline.dependency 'couchbase-lite-ios', '~> 1.4.1'
        offline.dependency 'payworks/mpos'
    end
end
