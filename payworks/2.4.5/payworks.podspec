Pod::Spec.new do |spec|
    spec.name               = 'payworks'
    spec.version            = '2.4.5'
    spec.license            = { :type => 'Copyright', :text => '©2015 payworks GmbH. All rights reserved.' }
    spec.homepage           = 'http://www.payworksmobile.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworksmobile.com' }
    spec.summary            = 'A delightful payment integration framework powered by payworks'
    spec.platform           = :ios, '7.0'
    spec.requires_arc       = true
    spec.source             = { :http => 'http://www.payworksmobile.com/downloads/mPOS-SDK-'+spec.version.to_s+'/mpos.ios_'+spec.version.to_s+'.zip' }


    spec.subspec 'mpos' do |mpos|

        mpos.subspec 'core' do |core|
            core.vendored_frameworks    = 'mpos.core.framework'
            core.resource               = 'mpos.core-resources.bundle'
            core.frameworks             = 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration'
            core.dependency               'CocoaLumberjack',    '~> 2.0.0'
            core.dependency               'Lockbox',            '~> 2.1.0'
        end

        mpos.subspec 'accessories' do |accessories|

            accessories.subspec 'miura' do |miura|
                miura.vendored_frameworks = 'mpos.accessories.miura-shuttle.framework'
                miura.dependency            'payworks/mpos/core'
                miura.dependency            'payworks/mpos/comlinks/externalaccessory'
            end

            accessories.subspec 'verifone-e105' do |verifone|
                verifone.vendored_frameworks = 'mpos.accessories.verifone-e105.framework'
                verifone.dependency            'payworks/mpos/core'
                verifone.dependency            'payworks/mpos/comlinks/verifone'
            end

            accessories.subspec 'sewoo' do |sewoo|
                sewoo.vendored_frameworks = 'mpos.accessories.sewoo.framework'
                sewoo.dependency            'payworks/mpos/core'
            end

        end

        mpos.subspec 'comlinks' do |comlinks|
    
            comlinks.subspec 'externalaccessory' do |externalaccessory|
                externalaccessory.vendored_frameworks = 'mpos.comlinks.externalaccessory.framework'
                externalaccessory.frameworks          = 'ExternalAccessory'
                externalaccessory.dependency            'payworks/mpos/core'
            end

            comlinks.subspec 'verifone' do |verifone|
                verifone.vendored_frameworks = 'mpos.comlinks.verifone.framework'
                verifone.frameworks          = 'AVFoundation', 'CoreMedia', 'MediaToolbox', 'AudioToolbox', 'MediaPlayer'
                verifone.library             = 'stdc++.6'
                verifone.dependency            'payworks/mpos/core'
            end

        end

        mpos.subspec 'ui' do |ui|

            ui.vendored_frameworks = 'mpos-ui.framework'
            ui.resource            = 'mpos-ui-resources.bundle'
            ui.dependency            'payworks/mpos/core'
            ui.dependency            'MPBSignatureViewController', '~> 1.4.11'

        end

    end

end
