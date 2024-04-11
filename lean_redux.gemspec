Gem::Specification.new do |spec|
  spec.name                  = 'lean_redux'
  spec.version               = '0.1.1'
  spec.authors               = 'Justas Kazakauskas'
  spec.email                 = 'leakymirror@gmail.com'
  spec.summary               = 'Redux implementation in Ruby'
  spec.description           = 'Redux implementation in Ruby'
  spec.homepage              = 'https://github.com/justaskz/lean_redux'
  spec.license               = 'MIT'
  spec.required_ruby_version = '>= 2.7'
  spec.metadata              = { 'rubygems_mfa_required' => 'true' }

  spec.add_runtime_dependency 'dry-struct', '~> 1.6.0'

  spec.files = Dir['lib/**/*.rb']
end
