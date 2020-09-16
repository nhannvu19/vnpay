$:.push File.expand_path('../lib', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'vnpay'
  s.version     = '0.0.1'
  s.authors     = ['nhannvu19']
  s.email       = ['nhannvu.19@gmail.com']
  s.homepage    = 'https://github.com/nhannvu19/vnpay'
  s.summary     = 'Ruby library for VNPay integration'
  s.description = 'Ruby library for VNPay integration'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1'
end
