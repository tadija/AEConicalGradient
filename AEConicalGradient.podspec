Pod::Spec.new do |s|

s.name = 'AEConicalGradient'
s.version = '2.1.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'Conical (angular) gradient in Swift'

s.source = { :git => 'https://github.com/tadija/AEConicalGradient.git', :tag => s.version }
s.source_files = 'Sources/AEConicalGradient/*.swift'

s.swift_version = '4.2'

s.ios.deployment_target = '9.0'

s.homepage = 'https://github.com/tadija/AEConicalGradient'
s.author = { 'tadija' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

end
