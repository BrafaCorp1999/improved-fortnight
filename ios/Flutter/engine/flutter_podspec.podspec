# flutter_podspec.podspec

Pod::Spec.new do |s|
    s.name             = 'Flutter'
    s.version          = '1.0.0'
    s.summary          = 'High-performance, high-fidelity mobile apps.'
    s.description      = <<-DESC
      Flutter provides an easy and productive way to build and deploy high-performance mobile apps for Android and iOS.
    DESC
    s.homepage         = 'https://flutter.dev'
    s.license          = { :type => 'MIT' }
    s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
    s.source           = { :git => 'https://github.com/flutter/flutter.git', :tag => '1.0.0' }
    s.ios.deployment_target = '8.0'
    s.vendored_frameworks = 'Flutter.framework'
  end
  