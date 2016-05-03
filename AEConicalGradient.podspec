Pod::Spec.new do |s|
	s.name = 'AEConicalGradient'
	s.version = '1.0.1'
	s.summary = 'Conical (angular) gradient in Swift'

	s.homepage = 'https://github.com/tadija/AEConicalGradient'
	s.license = { :type => 'MIT', :file => 'LICENSE' }
	s.author = { 'tadija' => 'tadija@me.com' }
	s.social_media_url = 'http://twitter.com/tadija'

	s.ios.deployment_target = '8.0'

	s.source = { :git => 'https://github.com/tadija/AEConicalGradient.git', :tag => s.version }
	s.source_files = 'Sources/*.swift'
end