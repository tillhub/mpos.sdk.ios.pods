Pod::Spec.new do |spec|
    spec.name               = 'payworks'
    spec.version            = '2.31.2'
    spec.license            = { :type => 'Copyright', :text => '©2016 payworks GmbH. All rights reserved.' }
    spec.homepage           = 'https://www.payworksmobile.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworksmobile.com' }
    spec.summary            = 'A delightful payment integration framework powered by payworks'
    spec.platform           = :ios, '8.0'
    spec.requires_arc       = true
    spec.source             = { :http => 'https://releases.payworks.io/artifactory/mpos-ios/io/payworks/mpos.ios.sdk/'+spec.version.to_s+'/mpos.ios.sdk-'+spec.version.to_s+'.zip' }
    spec.default_subspec       = 'mpos'

    spec.subspec 'mpos' do |mpos|

        mpos.subspec 'core' do |core|
            core.vendored_frameworks    = 'mpos_core.framework'
            core.resource               = 'mpos_core_resources.bundle'
            core.frameworks             = 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration', 'UIKit', 'Foundation'
            core.library                = 'icucore'
            core.dependency               'CocoaLumberjack', '~> 3.2'
            core.dependency               'MPAFNetworking', '~> 2.5.4'
        end

        mpos.subspec 'accessories' do |accessories|

            accessories.subspec 'miura' do |miura|
                miura.vendored_frameworks = 'mpos_accessories_miura_shuttle.framework'
                miura.dependency            'payworks/mpos/core'
                miura.dependency            'payworks/mpos/comlinks/externalaccessory'
                miura.dependency            'payworks/mpos/comlinks/tcp'
            end

            accessories.subspec 'verifone' do |verifone|
                verifone.vendored_frameworks = 'mpos_accessories_verifone.framework'
                verifone.frameworks          = 'MediaPlayer'
                verifone.dependency            'payworks/mpos/core'
                verifone.dependency            'payworks/mpos/comlinks/verifone'
            end

            accessories.subspec 'vipa' do |vipa|
                vipa.vendored_frameworks = 'mpos_accessories_vipa.framework'
                vipa.dependency            'payworks/mpos/core'
                vipa.dependency            'payworks/mpos/comlinks/tcp'
            end

            accessories.subspec 'sewoo' do |sewoo|
                sewoo.vendored_frameworks = 'mpos_accessories_sewoo.framework'
                sewoo.dependency            'payworks/mpos/core'
            end

        end

        mpos.subspec 'comlinks' do |comlinks|

            comlinks.subspec 'externalaccessory' do |externalaccessory|
                externalaccessory.vendored_frameworks = 'mpos_comlinks_externalaccessory.framework'
                externalaccessory.frameworks          = 'ExternalAccessory'
                externalaccessory.dependency            'payworks/mpos/core'
            end

            comlinks.subspec 'verifone' do |verifone|
                verifone.vendored_frameworks = 'mpos_comlinks_verifone.framework'
                verifone.frameworks          = 'AVFoundation', 'CoreMedia', 'MediaToolbox', 'AudioToolbox', 'MediaPlayer'
                verifone.library             = 'stdc++.6.0.9'
                verifone.dependency            'payworks/mpos/core'
            end

            comlinks.subspec 'tcp' do |tcp|
                tcp.vendored_frameworks = 'mpos_comlinks_tcp.framework'
                tcp.dependency            'payworks/mpos/core'
            end

        end

    end


    spec.subspec 'offline' do |offline|

        offline.dependency 'couchbase-lite-ios', '~> 1.4.1'
        offline.dependency 'payworks/mpos'

    end

end
