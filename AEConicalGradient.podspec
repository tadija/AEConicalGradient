Pod::Spec.new do |s|
s.name = 'AEConicalGradient'
s.version = '1.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'Conical (angular) gradient in Swift'

s.homepage = 'https://github.com/tadija/AEConicalGradient'
s.author = { 'tadija' => 'tadija@me.com' }
s.social_media_url = 'http://twitter.com/tadija'

s.source = { :git => 'https://github.com/tadija/AEConicalGradient.git', :tag => s.version }
s.source_files = 'Source/*.swift'

s.ios.deployment_target = '8.0'
end