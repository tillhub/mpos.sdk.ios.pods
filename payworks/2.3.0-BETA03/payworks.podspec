Pod::Spec.new do |spec|
	spec.name				= 'payworks'
	spec.version			= '2.3.0-BETA03'
	spec.license			= { :type => 'Copyright', :text => '©2015 payworks GmbH. All rights reserved.' }
	spec.homepage			= 'http://www.payworksmobile.com/developers'
	spec.authors			= { 'payworks' => 'developers@payworksmobile.com' }
	spec.summary			= 'A delightful payment integration framework powered by payworks'
	spec.platform			= :ios, '7.0'
	spec.requires_arc		= true
	spec.source				= { :http => 'http://www.payworksmobile.com/downloads/mPOS-SDK-'+spec.version.to_s+'/mpos.ios_'+spec.version.to_s+'.zip' }


	spec.subspec 'mpos' do |mpos|
	
		mpos.subspec 'core' do |core|
			core.vendored_frameworks	= 'mpos.ios_'+spec.version.to_s+'/mpos.core.framework'
			core.resource				= 'mpos.ios_'+spec.version.to_s+'/mpos.core-resources.bundle'
			core.frameworks 			= 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration'
			core.dependency				'CocoaLumberjack', '~> 1.9'
		end
	
		mpos.subspec 'accessories' do |accessories|
	
			accessories.subspec 'miura'	do |miura|
				miura.vendored_frameworks = 'mpos.ios_'+spec.version.to_s+'/mpos.accessories.miura-shuttle.framework'
				miura.dependency 'payworks/mpos/comlinks/externalaccessory'
			end
		
			accessories.subspec 'verifone-e105' do |verifone|
				verifone.vendored_frameworks = 'mpos.ios_'+spec.version.to_s+'/mpos.accessories.verifone-e105.framework'
				verifone.dependency 'payworks/mpos/comlinks/verifone'
			end

	#		accessories.subspec 'verifone-eseries' do |verifoneeseries|
	#			verifoneeseries.source				= { :http => 'https://releases.payworks.io/ios/mpos.accessories.verifone-eseries-2.3.0-PRE01.zip' }
	#			verifoneeseries.vendored_frameworks	= 'mpos.accessories.verifone-eseries-2.3.0-PRE01/mpos.accessories.verifone-eseries.framework'
	#			verifoneeseries.dependency			'payworks/mpos/core'			
	#			verifoneeseries.dependency			'payworks/mpos/comlinks/verifone'
	#		end


		end

		mpos.subspec 'comlinks' do |comlinks|
	
			comlinks.subspec 'externalaccessory' do |externalaccessory|
				externalaccessory.vendored_frameworks = 'mpos.ios_'+spec.version.to_s+'/mpos.comlinks.externalaccessory.framework'
				externalaccessory.frameworks 			= 'ExternalAccessory'
				externalaccessory.dependency			'payworks/mpos/core'
			end
		
			comlinks.subspec 'verifone' do |verifone|
				verifone.vendored_frameworks = 'mpos.ios_'+spec.version.to_s+'/mpos.comlinks.verifone.framework'
				verifone.frameworks 		 = 'AVFoundation', 'CoreMedia', 'MediaToolbox', 'AudioToolbox', 'MediaPlayer'
				verifone.library			 = 'stdc++.6'
				verifone.dependency			 'payworks/mpos/core'
			end

		end
		
		mpos.subspec 'ui' do |ui|
			
			ui.vendored_frameworks = 'mpos.ios_'+spec.version.to_s+'/mPOSUI.framework'
			ui.resource			   = 'mpos.ios_'+spec.version.to_s+'/mPOSUIResources.bundle'
			ui.dependency			'payworks/mpos/core'
			ui.dependency			'MPBSignatureViewController', '~> 1'
			
		end
	end
end
